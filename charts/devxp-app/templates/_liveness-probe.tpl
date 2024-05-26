{{- define "liveness-probe" }}
{{- $liveness := .liveness }}
{{- $port := .port }}
{{- $actuator := .actuator }}
{{- $path := $liveness.path }}
{{- $data := $liveness }}
{{- $headers := $liveness.httpGet.httpHeaders }}

{{- if $liveness.enabled }}
  {{- if $actuator.enabled }}
    {{- $port = $actuator.port.port }}
    {{- $path = $actuator.liveness.path }}
    {{- $data = $actuator.liveness }}
    {{- $headers = $actuator.liveness.httpGet.httpHeaders }}
  {{- end }}
livenessProbe:
  {{- if not $liveness.exec }}
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
