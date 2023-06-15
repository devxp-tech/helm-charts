#!/bin/bash

path="${1:-.}"
final_exit_code=0

while read -r helmchart; do
	dir="$(dirname "$helmchart")"
    echo "*** Proceeding to test Helm chart: $helmchart ***"
	set +e
	helm datree test "$dir" --ignore-missing-schemas -- --set name=ci
	exitcode=$?
	set -e
	if [ "$exitcode" -gt "$final_exit_code" ]; then
        final_exit_code="$exitcode"
    fi
    echo ""
done < <(find "$path" -type f -name 'Chart.y*ml')

if [ "$final_exit_code" = 0 ]; then
    echo "Success"
else
    echo "Violations found, returning exit code $final_exit_code"
fi
exit "$final_exit_code"
