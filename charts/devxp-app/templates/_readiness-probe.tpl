{{- define "readiness-probe" }}
{{- $readiness := .readiness }}
{{- $port := .port }}
{{- $actuator := .actuator }}
{{- $path := $readiness.path }}
{{- $data := $readiness }}

{{- if $readiness.enabled }}
  {{- if $actuator.enabled }}
    {{- $path = $actuator.readiness.path }}
    {{- $port = $actuator.port.port }}
    {{- $data = $actuator.readiness }}
  {{- end }}
readinessProbe:
  {{- if not $readiness.exec }}
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
