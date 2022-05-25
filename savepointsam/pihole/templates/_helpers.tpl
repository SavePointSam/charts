{{/*
Return the proper pihole image name
*/}}
{{- define "pihole.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.pihole.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "pihole.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.pihole.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "pihole.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Return true if cert-manager required annotations for TLS signed certificates are set in the Ingress annotations
Ref: https://cert-manager.io/docs/usage/ingress/#supported-annotations
*/}}
{{- define "pihole.ingress.certManagerRequest" -}}
{{ if or (hasKey . "cert-manager.io/cluster-issuer") (hasKey . "cert-manager.io/issuer") }}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Compile all warnings into a single message.
*/}}
{{- define "pihole.validateValues" -}}
{{- $messages := list -}}
{{- $messages := append $messages (include "pihole.validateValues.foo" .) -}}
{{- $messages := append $messages (include "pihole.validateValues.bar" .) -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message -}}
{{- end -}}
{{- end -}}

{{/*
Return webui password Secret name
*/}}
{{- define "pihole.secrets.webui.password.name" -}}
{{ template "common.names.fullname" . }}-webui-password
{{- end -}}
