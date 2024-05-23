{{- define "liveness-probe" }}
{{- $liveness := .liveness }}
{{- $port := .port }}
{{- $actuator := .actuator }}
{{- $path := $liveness.path }}
{{- $data := $liveness }}

{{- if $liveness.enabled }}
  {{- if $actuator.enabled }}
    {{- $path = $actuator.liveness.path }}
    {{- $port = $actuator.port.port }}
    {{- $data = $actuator.liveness }}
  {{- end }}
livenessProbe:
  {{- if not $liveness.exec }}
  httpGet:
    path: {{ $path }}
    port: {{ $port }}
    scheme: {{ $data.scheme}}
  {{- else }}
  exec: {{- $data.exec | toYaml | nindent 4 }}
  {{- end }}
  initialDelaySeconds: {{ $data.initialDelaySeconds }}
  timeoutSeconds: {{ $data.timeoutSeconds }}
  periodSeconds: {{ $data.periodSeconds }}
  failureThreshold: {{ $data.failureThreshold }}
  successThreshold: {{ $data.successThreshold }}
{{- end }}
{{- end -}}
