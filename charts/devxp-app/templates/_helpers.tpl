{{/*
Expand the name of the chart.
*/}}
{{- define "devxp-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "devxp-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "devxp-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "devxp-app.labels" -}}
app: {{ .Values.name }}
version: {{ ($version := .Values.image.tag  | toString | quote) }}
backstage.io/kubernetes-id: {{ .Values.name }}
helm.sh/chart: {{ include "devxp-app.chart" . }}
{{ include "devxp-app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ $version }}
{{- end }}
app.kubernetes.io/managed-by: argocd
{{- end }}

{{/*
Selector labels
*/}}
{{- define "devxp-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "devxp-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "devxp-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "devxp-app.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "namespace" }}
  {{- if eq .Release.Namespace "default" }}
    {{- .Values.name }}
  {{- else }}
    {{- .Release.Namespace }}
  {{- end }}
{{- end }}

{{- define "hpa-version" }}
  {{- if .Capabilities.APIVersions.Has "autoscaling/v2/HorizontalPodAutoscaler" }}
    {{- "autoscaling/v2" }}
  {{- else }}
    {{- "autoscaling/v2beta2" }}
  {{- end }}
{{- end }}

{{- define "hpa-targets" -}}
name: {{ .Values.name }}
{{- if .Values.argoRollouts.enabled }}
apiVersion: argoproj.io/v1alpha1
kind: Rollout
{{- else }}
apiVersion: apps/v1
kind: Deployment
{{- end }}
{{- end }}

{{/* Generate the default image string to deployment */}}
{{- define "image" -}}
{{- if not .Values.image.repository }}
{{- printf "%s/%s:%s" .Values.image.repository .Values.name .Values.image.tag }}
{{- else }}
{{- printf "%s:%s" .Values.image.repository .Values.image.tag }}
{{- end  }}
{{- end  }}


{{- define "vs-hosts" }}
{{- $hosts := list }}
{{- $name := .Values.name }}
{{- $hosts = append $hosts (printf "%s.%s" $name .Values.network.domain) }}
{{- if .Values.virtualServices.custom.hosts }}
  {{- range $_, $host:= .Values.virtualServices.custom.hosts }}
  {{- $hosts = append $hosts ($host) }}
  {{- end }}
{{- end }}
{{- $hosts | toYaml }}
{{- end }}




