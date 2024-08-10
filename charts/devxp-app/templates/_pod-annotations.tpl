{{- define "all-pod-annotations" }}
{{- $all := dict }}
{{- $pod := .Values.podAnnotations }}
{{- $instrumentations := fromYaml (include "instrumentation-annotations" .) }}
{{- $all = merge $instrumentations $pod  }}
{{- $all | toYaml }}
{{- end -}}
