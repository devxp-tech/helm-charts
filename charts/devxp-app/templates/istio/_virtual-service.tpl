{{- define "vs-hosts" }}
{{- $hosts := list }}
{{- $name := .Values.name }}
{{- $hosts = append $hosts (printf "%s.%s" $name .Values.global.network.domain) }}
{{- if .Values.istio.virtualServices.custom.hosts }}
  {{- range $_, $host := .Values.istio.virtualServices.custom.hosts }}
  {{- $hosts = append $hosts $host }}
  {{- end }}
{{- end }}
{{- $hosts | toYaml | nindent 2 }}
{{- end }}

