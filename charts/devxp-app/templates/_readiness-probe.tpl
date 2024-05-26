{{- define "readiness-probe" }}
{{- $readiness := .readiness }}
{{- $port := .port }}
{{- $actuator := .actuator }}
{{- $path := $readiness.path }}
{{- $data := $readiness }}
{{- $headers := $readiness.httpGet.httpHeaders }}

{{- if $readiness.enabled }}
  {{- if $actuator.enabled }}
    {{- $port = $actuator.port.port }}
    {{- $path = $actuator.readiness.path }}
    {{- $data = $actuator.readiness }}
    {{- $headers = $actuator.readiness.httpGet.httpHeaders }}
  {{- end }}
readinessProbe:
  {{- if not $readiness.exec }}
  httpGet:
    port: {{ $port }}
    path: {{ $path }}
    scheme: {{ $data.scheme }}
    {{- if $headers }}
    httpHeaders:
      {{- range $headers }}
      - name: {{ .name }}
        value: {{ .value }}
      {{- end }}
    {{- end }}
  {{- else }}
  exec: {{- $data.exec | toYaml | nindent 4 }}
  {{- end }}
  initialDelaySeconds: {{ $data.initialDelaySeconds }}
  timeoutSeconds: {{ $data.timeoutSeconds }}
  periodSeconds: {{ $data.periodSeconds }}
  failureThreshold: {{ $data.failureThreshold }}
  successThreshold: {{ $data.successThreshold }}
{{- end }}
{{- end }}
