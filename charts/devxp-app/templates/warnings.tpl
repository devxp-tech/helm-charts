{{/* validate if name is seted by user */}}
{{- if not .Values.name -}}
  {{- fail ".Values.name must not be empty" -}}
{{- end -}}

{{/* validate if port is a valid port */}}
{{- if not .Values.container.port -}}
  {{- fail ".Values.container.port must not be empty and a fully qualified integer app port" -}}
{{- end -}}

{{/*Validating if instrumentations is enabled and has valid language selected*/}}
{{- if .Values.instrumentation.enabled -}}
  {{- $language := .Values.instrumentation.language -}}
  {{- $validLanguages := list "go" "java" "nodejs" "dotnet" "python" "nginx" -}}
  {{- if not $language -}}
    {{- fail (printf "When .Values.instrumentation.enable is true them .Values.instrumentation.language can not be empty. Use one of: %s" (join ", " $validLanguages)) -}}
  {{- end -}}
  {{- if not (has $language $validLanguages) -}}
    {{- fail (printf "Invalid instrumentation Language: %s. This value should be one of: %s" $language (join ", " $validLanguages)) -}}
  {{- end -}}
{{- end -}}
