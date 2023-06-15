{{/* validate if name is seted by user */}}
{{- if not .Values.name -}}
  {{- fail ".Values.name must not be empty" -}}
{{- end -}}

{{/* validate if port is a valid port */}}
{{- if not .Values.container.port -}}
  {{- fail ".Values.container.port must not be empty and a fully qualified integer app port" -}}
{{- end -}}



