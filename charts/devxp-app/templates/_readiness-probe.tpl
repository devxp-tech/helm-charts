{{- define "readiness-probe" }}
{{- $readiness := .readiness }}
{{- $port := .port }}
{{- $actuator := .actuator }}
{{- $path := $readiness.path }}
{{- if $readiness.enabled }}
  {{- if $actuator.enabled }}
    {{- $path = $actuator.readiness.path }}
    {{- $port = $actuator.port.port }}
  {{- end }}
readinessProbe:
  {{- if not $readiness.exec }}
  httpGet:
    path: {{ $path }}
    port: {{ $port }}
    scheme: {{ $readiness.scheme}}
  {{- else }}
  exec: {{- $readiness.exec | toYaml | nindent 4 }}
  {{- end }}
  initialDelaySeconds: {{ $readiness.initialDelaySeconds }}
  timeoutSeconds: {{ $readiness.timeoutSeconds }}
  periodSeconds: {{ $readiness.periodSeconds }}
  failureThreshold: {{ $readiness.failureThreshold }}
  successThreshold: {{ $readiness.successThreshold }}
{{- end }}
{{- end -}}
