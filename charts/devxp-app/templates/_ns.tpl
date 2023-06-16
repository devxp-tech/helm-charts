{{- define "ns-annotaions" }}
{{- $annotations := .Values.namespace.annotations }}
{{- $_ := set $annotations "backstage.io/kubernetes-id"  .Values.name }}
{{- toYaml $annotations}}
{{- end }}

{{- define "ns-labels" }}
{{- $labels := .Values.namespace.labels }}
{{- $_ := set $labels "app"  .Values.name }}
{{- if .Values.global.istio }}
{{- $_ = set $labels "istio-injection"  "enabled" }}
{{- end }}
{{- $_ = set $labels "kubernetes.io/metadata.name"  .Values.name }}
{{- toYaml $labels}}
{{- end }}
