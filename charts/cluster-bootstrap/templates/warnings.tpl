{{ if not .Values.global.application.cluster }}
{{ fail ".Values.global.application.cluster can not be empty." }}
{{ end }}

{{ if not .Values.global.application.project }}
{{ fail ".Values.global.application.project can not be empty." }}
{{ end }}

