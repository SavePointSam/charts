{{/*
Return the proper unbound image name
*/}}
{{- define "unbound.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.unbound.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "unbound.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.unbound.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "unbound.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Return unbound configuration ConfigMap name
*/}}
{{- define "unbound.names.configmap" -}}
{{ template "common.names.fullname" . }}-config
{{- end -}}
