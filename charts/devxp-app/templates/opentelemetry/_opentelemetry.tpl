{{/*
Return the appropriate annotations for instrumentation based on the language
*/}}
{{- define "instrumentation-annotations" -}}
{{- if .Values.instrumentation }}
  {{- if eq .Values.instrumentation "dotnet" -}}
instrumentation.opentelemetry.io/inject-dotnet: "true"
  {{- else if eq .Values.instrumentation "go" -}}
instrumentation.opentelemetry.io/inject-go: "true"
sidecar.opentelemetry.io/inject: "true"
  {{- else if eq .Values.instrumentation "java" -}}
instrumentation.opentelemetry.io/inject-java: "true"
  {{- else if eq .Values.instrumentation "nodejs" -}}
instrumentation.opentelemetry.io/inject-nodejs: "true"
  {{- else if eq .Values.instrumentation "python" -}}
instrumentation.opentelemetry.io/inject-python: "true" 
  {{- else if eq .Values.instrumentation "nginx" -}}
instrumentation.opentelemetry.io/inject-nginx: "true"
  {{- end -}}
{{- end -}}
{{- end -}}

