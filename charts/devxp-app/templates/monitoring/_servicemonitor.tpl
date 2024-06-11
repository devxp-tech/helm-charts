{{- define "service-monitor" }}
{{- $monitor := .monitor.serviceMonitor }}
{{- $port := .port }}
{{- $actuator := .actuator }}
{{- $namespaceSelector := $monitor.namespaceSelector }}
{{- $annotations := $monitor.annotations }}
{{- $labels := $monitor.labels }}
{{- $interval := $monitor.interval }}
{{- $path := $monitor.path }}
{{- $scrapeTimeout := $monitor.scrapeTimeout }}
{{- $scheme := $monitor.scheme }}
{{- if $monitor.enabled }}
  {{- if $actuator.enabled }}
    {{- $port = $actuator.port.name }}
    {{- $path = $actuator.metrics.path }}
  {{- end }}
  {{- if $monitor.extraPort.enabled }}
    {{- $port = $monitor.extraPort.name }}
    {{- $path = $monitor.path }}
  {{- end }}  
monitoring:
  serviceMonitor:
    - port: {{ $port }}  
      interval: {{ $interval }}
      scrapeTimeout: {{ $scrapeTimeout }}
      path: {{ $path }}
      scheme: {{ $scheme }}
{{- end }}
{{- end }}
