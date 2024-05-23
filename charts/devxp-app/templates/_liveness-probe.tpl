{{- define "liveness-probe" }}
{{- $liveness := .liveness }}
{{- $port := .port }}
{{- $actuator := .actuator }}
{{- $path := $liveness.path }}
{{- if $liveness.enabled }}
  {{- if $actuator.enabled }}
    {{- $path = $actuator.liveness.path }}
    {{- $port = $actuator.port.port }}
  {{- end }}
livenessProbe:
  {{- if not $liveness.exec }}
  httpGet:
    path: {{ $path }}
    port: {{ $port }}
    scheme: {{ $liveness.scheme}}
  {{- else }}
  exec: {{- $liveness.exec | toYaml | nindent 4 }}
  {{- end }}
  initialDelaySeconds: {{ $liveness.initialDelaySeconds }}
  timeoutSeconds: {{ $liveness.timeoutSeconds }}
  periodSeconds: {{ $liveness.periodSeconds }}
  failureThreshold: {{ $liveness.failureThreshold }}
  successThreshold: {{ $liveness.successThreshold }}
{{- end }}
{{- end -}}
