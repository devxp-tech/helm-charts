{{ if not .Values.global.application.cluster.host }}
{{ fail ".Values.global.application.cluster.host can not be empty." }}
{{ end }}

{{ if not .Values.global.application.cluster.alias }}
{{ fail ".Values.global.application.cluster.alias can not be empty." }}
{{ end }}

{{ if not .Values.global.application.project }}
{{ fail ".Values.global.application.project can not be empty." }}
{{ end }}

