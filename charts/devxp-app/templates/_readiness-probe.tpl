{{- define "readiness-probe" }}
{{- $probe := .probe }}
{{- $port := .port }}
{{- $actuator := .actuator }}
{{- $path := $probe.path }}
  {{- if $actuator.enabled }}
    {{- $path = $actuator.readiness.path }}
    {{- $port = $actuator.port.port }}
  {{- end }}
{{- if $probe.enabled }}
readinessProbe:
  {{- if not $probe.exec }}
  httpGet:
    path: {{ $path }}
    port: {{ $port }}
    scheme: {{ $probe.scheme}}
  {{- else }}
  exec: {{- $probe.exec | toYaml | nindent 4 }}
  {{- end }}
  initialDelaySeconds: {{ $probe.initialDelaySeconds }}
  timeoutSeconds: {{ $probe.timeoutSeconds }}
  periodSeconds: {{ $probe.periodSeconds }}
  failureThreshold: {{ $probe.failureThreshold }}
  successThreshold: {{ $probe.successThreshold }}
{{- end }}
{{- end -}}
