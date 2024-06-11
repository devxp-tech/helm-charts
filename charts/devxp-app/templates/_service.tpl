{{- define "service" }}
{{- $monitor := .monitor.serviceMonitor }}
{{- $actuator := .actuator }}

{{- if and $monitor.enabled (or $actuator.enabled $monitor.extraPort.enabled) }}
  {{- if $actuator.enabled }}
  - name: {{ $actuator.port.name }}
    port: {{ $actuator.port.port }}
    targetPort: {{ $actuator.port.targetPort }}
    protocol: {{ $actuator.port.protocol }}
  {{- end }}
  {{- if $monitor.extraPort.enabled }}
  - name: {{ $monitor.extraPort.name }}
    port: {{ $monitor.extraPort.number }}
    targetPort: {{ $monitor.extraPort.targetPort }}
    protocol: {{ $monitor.extraPort.protocol }}
  {{- end }}
{{- end }}
{{- end }}
