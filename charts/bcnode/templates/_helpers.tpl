

{{- define "k8s-deployment.name" -}}
{{ .root.Release.Name }}-deployment-{{ .Slot }}
{{- end }}

{{- define "k8s.release-timestamp" -}}
{{ now | date "2006-01-02 15:04:05" | quote }}
{{- end }}

{{- define "k8s-service-account.name" -}}
{{ .root.Release.Name }}-svc-account-{{ .Slot }}
{{- end }}

{{- define "k8s-service.name" -}}
{{ .root.Release.Name }}-service-{{ .Slot }}
{{- end }}


{{- define "k8s-configmap.name" -}}
{{ .root.Release.Name }}-config-{{ .Slot }}
{{- end }}

{{- define "k8s-persistent-volume.name" -}}
{{ .root.Release.Name }}-pv-{{ .Slot }}
{{- end }}

{{- define "k8s-persistent-volume-claim.name" -}}
{{ .root.Release.Name }}-pvc-{{ .Slot }}
{{- end }}

{{/* Expand the name of the chart. */}}
{{- define "k8s.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Create chart name and version as used by the chart label. */}}
{{- define "k8s.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}



{{/* Selector labels */}}
{{- define "k8s.selectorLabels" -}}
app.kubernetes.io/slot: {{ .Slot }}
app.kubernetes.io/name: {{ include "k8s.name" .root }}
app.kubernetes.io/instance: {{ .root.Release.Name }}
{{- end }}



{{/*Standard labels*/}}
{{- define "k8s.labelset" -}}
app.kubernetes.io/slot: {{ .Slot }}
app.kubernetes.io/name: {{ include "k8s.name" .root }}
app.kubernetes.io/instance: {{ .root.Release.Name }}
{{- if .root.Chart.AppVersion }}
app.kubernetes.io/version: {{ .root.Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .root.Release.Service }}
helm.sh/chart: {{ include "k8s.chart" .root }}
{{- end }}
