{{/*
Return the appropriate annotations for instrumentation based on the language
*/}}
{{- define "instrumentation-annotations" }}
{{- $annotations := dict }}
{{- if .Values.instrumentation.enabled }}
  {{- $language := .Values.instrumentation.language }}
  {{- $annotations = merge $annotations (dict 
    (printf "instrumentation.opentelemetry.io/inject-%s" $language) "true"
  ) }}
  {{- if eq $language "go" }}
    {{- $annotations = merge $annotations (dict 
      "instrumentation.opentelemetry.io/otel-go-auto-target-exe" (quote "/app")
      "sidecar.opentelemetry.io/inject" "sidecar"
    ) }}
  {{- end }}
{{- end }}
{{- $annotations | toYaml }}
{{- end }}
