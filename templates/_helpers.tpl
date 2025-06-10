{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "HelmHarbor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "HelmHarbor.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "HelmHarbor.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}

{{- define "HelmHarbor.labels" -}}
helm.sh/chart: {{ include "HelmHarbor.chart" . }}
{{ include "HelmHarbor.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{/*
Selector labels
*/}}

{{- define "HelmHarbor.selectorLabels" -}}
app.kubernetes.io/name: {{ include "HelmHarbor.name" . }}
app.kubernetes.io/instance: {{ default .Release.Name .Values.instanceOverride }}
{{- end -}}


{{/*
Custom labels
*/}}
{{- define "HelmHarbor.customLabels" -}}
{{- if .Values.customLabels }}
{{ toYaml .Values.customLabels }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "HelmHarbor.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "HelmHarbor.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "portNumber" -}}
{{- if kindIs "map" .port }}
{{- get .port "number" }}
{{- else }}
{{- .port }}
{{- end }}
{{- end -}}

{{- define "portName" -}}
{{- if kindIs "map" .port }}
{{- get .port "name" }}
{{- end }}
{{- end -}}
