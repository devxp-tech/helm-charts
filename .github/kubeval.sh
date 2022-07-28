#!/bin/bash

mkdir ./.bin
export PATH="./.bin:$PATH"

set -euxo pipefail

# renovate: datasource=github-releases depName=kubeval packageName=instrumenta/kubeval
KUBEVAL_VERSION=v0.16.1

# renovate: datasource=github-releases depName=semver2 packageName=Ariel-Rodriguez/sh-semversion-2
SEMVER_VERSION=1.0.3

CHART_DIRS="$(git diff --find-renames --name-only "$(git rev-parse --abbrev-ref HEAD)" remotes/origin/main -- charts | cut -d '/' -f 2 | uniq)"
SCHEMA_LOCATION="https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/"

# install kubeval
curl --silent --show-error --fail --location --output /tmp/kubeval.tar.gz https://github.com/instrumenta/kubeval/releases/download/"${KUBEVAL_VERSION}"/kubeval-linux-amd64.tar.gz
tar -xf /tmp/kubeval.tar.gz kubeval

# validate charts
for CHART_DIR in ${CHART_DIRS}; do
  helm template "${CHART_DIR}" | ./kubeval --strict --ignore-missing-schemas --kubernetes-version "${KUBERNETES_VERSION#v}" --schema-location "${SCHEMA_LOCATION}"
done


