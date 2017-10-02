{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 -}}
{{- end -}}

{{- define "appname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 -}}
{{- end -}}

{{- define "etcd.fullname" -}}
{{- printf "%s-%s" .Release.Name "etcd" | trunc 63 -}}
{{- end -}}