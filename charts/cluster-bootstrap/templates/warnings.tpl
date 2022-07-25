{{ if not .Values.global.application.cluster.server }}
{{ fail ".Values.global.application.cluster.server can not be empty." }}
{{ end }}

{{ if not .Values.global.application.cluster.name }}
{{ fail ".Values.global.application.cluster.name can not be empty." }}
{{ end }}

{{ if not .Values.global.application.project }}
{{ fail ".Values.global.application.project can not be empty." }}
{{ end }}

