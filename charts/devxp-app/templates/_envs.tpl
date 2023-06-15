{{- define "all-envs" -}}
{{- $envs := dict }}
{{- $secrets := dict }}
{{- $list := list }}
{{- $environments := .Values.envs }}
{{- range $_, $value := $environments }}
  {{- if $value.value }}
    {{- $_ = set $envs $value.name ($value.value | toString) }}
  {{- else }}
    {{- $_ = set $secrets $value.name $value.valueFrom }}
  {{- end }}
{{- end }}

{{- range $key, $value := $envs }}
  {{- $list = append $list (dict "name" $key "value" $value) }}
{{- end }}
{{- range $key, $value := $secrets }}
  {{- $list = append $list (dict "name" $key "valueFrom" $value )}}
{{- end }}
{{- toYaml $list }}
{{- end }}

{{- define "merged-envs" -}}
{{- $tmp := dict }}
{{- $secrets := dict }}
{{- $list := list }}
{{- range $_, $value := .envs }}
  {{- if $value.value }}
    {{- $_ = set $tmp $value.name ($value.value | toString) }}
  {{- else }}
    {{- $_ = set $secrets $value.name $value.valueFrom }}
  {{- end }}
{{- end }}
{{- range $_, $value := .overrides }}
  {{- if $value.value }}
    {{- $_ = set $tmp $value.name ($value.value | toString) }}
  {{- else }}
    {{- $_ = set $secrets $value.name $value.valueFrom }}
  {{- end }}
{{- end }}
{{- range $key, $value := $tmp }}
  {{- $list = append $list (dict "name" $key "value" $value) }}
{{- end }}
{{- range $key, $value := $secrets }}
  {{- $list = append $list (dict "name" $key "valueFrom" $value )}}
{{- end }}
{{- toYaml $list }}
{{- end }}
