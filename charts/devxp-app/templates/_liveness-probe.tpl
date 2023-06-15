{{- define "liveness-probe" }}
{{- $probe := .probe }}
{{- $port := .port }}
{{- if $probe.enabled }}
livenessProbe:
  {{- if not $probe.exec }}
  httpGet:
    path: {{ $probe.path }}
    scheme: {{ $probe.scheme}}
    port: {{ $port }}
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
