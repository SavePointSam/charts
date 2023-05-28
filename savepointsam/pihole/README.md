# Pi-hole

[Pi-hole®](https://pi-hole.net/) is a DNS sinkhole that protects your devices
from unwanted content without installing any client-side software.

## TL;DR

```console
$ helm repo add savepointsam https://savepointsam.github.io/charts
$ helm install my-release savepointsam/pihole
```

## Introduction

This chart bootstraps a [Pi-hole](https://github.com/NLnetLabs/unbound)
deployment on a [Kubernetes](https://kubernetes.io) cluster using the
[Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.20+
- Helm 3.2.0+

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release savepointsam/pihole
```

The command deploys unbound on the Kubernetes cluster in the default
configuration. The [Parameters](#parameters) section lists the parameters that
can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and
deletes the release.

## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imageRegistry`    | Global Docker image registry                    | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `""`  |


### Common parameters

| Name                     | Description                                                                             | Value           |
| ------------------------ | --------------------------------------------------------------------------------------- | --------------- |
| `kubeVersion`            | Override Kubernetes version                                                             | `""`            |
| `nameOverride`           | String to partially override common.names.name                                          | `""`            |
| `fullnameOverride`       | String to fully override common.names.fullname                                          | `""`            |
| `namespaceOverride`      | String to fully override common.names.namespace                                         | `""`            |
| `commonLabels`           | Labels to add to all deployed objects                                                   | `{}`            |
| `commonAnnotations`      | Annotations to add to all deployed objects                                              | `{}`            |
| `clusterDomain`          | Kubernetes cluster domain name                                                          | `cluster.local` |
| `extraDeploy`            | Array of extra objects to deploy with the release                                       | `[]`            |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden) | `false`         |
| `diagnosticMode.command` | Command to override all containers in the deployment                                    | `["sleep"]`     |
| `diagnosticMode.args`    | Args to override all containers in the deployment                                       | `["infinity"]`  |


### Pi-hole parameters

| Name                                    | Description                                                                                   | Value                   |
| --------------------------------------- | --------------------------------------------------------------------------------------------- | ----------------------- |
| `pihole.timezone`                       | Timezone for log rotation calculation                                                         | `America/Los_Angeles`   |
| `pihole.upstream`                       | List of upstream DNS servers                                                                  | `["8.8.8.8","8.8.4.4"]` |
| `pihole.dnssec.enabled`                 | Enable DNSSEC                                                                                 | `false`                 |
| `pihole.privateRangeForwarding.enabled` | Enable forwarding of reverse lookup for private ranges                                        | `false`                 |
| `pihole.requireFqdn`                    | Only forward Full Qualified Domain Names                                                      | `true`                  |
| `pihole.virtualHost`                    | Hostname/IP for admin web UI access in addition to default "pi.hole/admin"                    | `""`                    |
| `pihole.ipv6Support`                    | Retain/Remove IPv6 configuration                                                              | `true`                  |
| `pihole.temperatureUnit`                | Preferred temperature unit ("c", "f", or "k")                                                 | `f`                     |
| `pihole.reverseServer.enabled`          | Enable rev-server                                                                             | `false`                 |
| `pihole.reverseServer.domain`           | Domain of local network router                                                                | `""`                    |
| `pihole.reverseServer.target`           | IP address of local network router                                                            | `""`                    |
| `pihole.reverseServer.cidr`             | Reverse DNS zone                                                                              | `""`                    |
| `pihole.webui.admin.email`              | Default admin email for web UI                                                                | `""`                    |
| `pihole.webui.admin.password`           | Default admin password for web UI                                                             | `""`                    |
| `pihole.webui.boxedLayout`              | Enable boxed layout in web UI                                                                 | `true`                  |
| `pihole.webui.queryLogging`             | Enable query logging                                                                          | `true`                  |
| `pihole.webui.theme`                    | Set web UI theme ("default-dark", "default-darker", "default-light", "default-auto", "lcars") | `default-auto`          |


### Pi-hole advanced parameters

| Name                                | Description                                                                                                                                                                                                                                                                                 | Value       |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| `pihole.advanced.webPort`           | This will break the 'webpage blocked' functionality of Pi-hole however it may help advanced setups. This guide explains how to restore webpage blocked functionality using a linux router DNAT rule: https://discourse.pi-hole.net/t/alternative-synology-installation-method/5454?u=diginc | `""`        |

| `pihole.advanced.webBindAddress`    | Lighttpd's bind address. If left unset lighttpd will bind to every interface, except when running in host networking mode where it will use `FTLCONF_LOCAL_IPV4` instead. | `""`        |
| `pihole.advanced.skipGravityOnBoot` | Use this option to skip updating the Gravity Database when booting up the container                                                                                                                                                                                                         | `false`     |
| `pihole.advanced.corsHosts`         | List of domains/subdomains on which CORS is allowed. Wildcards are not supported                                                                                                                                                                                                            | `[]`        |
| `pihole.advanced.customCacheSize`   | Set the cache size for dnsmasq. When pihole.dnssec.enabled is "true", then this setting is ignored                                                                                                                                                                                          | `10000`     |
| `pihole.advanced.ftlCmd`            | Customize the options with which pihole-ftl starts                                                                                                                                                                                                                                          | `no-daemon` |
| `pihole.advanced.ftlConf`           | Customize pihole-FTL.conf with settings described here: https://docs.pi-hole.net/ftldns/configfile/                                                                                                                                                                                         | `{}`        |


### Pi-hole experimental parameters

| Name                                | Description                                                                    | Value   |
| ----------------------------------- | ------------------------------------------------------------------------------ | ------- |
| `pihole.experimental.dnsmasqUser`   | Allows changing the user that FTLDNS runs as                                   | `""`    |
| `pihole.experimental.piholeUid`     | Overrides image's default pihole user id to match a host user id               | `""`    |
| `pihole.experimental.piholeGid`     | Overrides image's default pihole group id to match a host group id             | `""`    |
| `pihole.experimental.webUid`        | Overrides image's default www-data user id to match a host user id             | `""`    |
| `pihole.experimental.webGid`        | Overrides image's default www-data group id to match a host group id           | `""`    |
| `pihole.experimental.weblogsStdout` | "true" logs to defined files, "false" redirect access and error logs to stdout | `false` |


### Pi-hole deployment parameters

| Name                                                     | Description                                                                                                              | Value           |
| -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | --------------- |
| `pihole.image.registry`                                  | Pi-hole image registry                                                                                                   | `docker.io`     |
| `pihole.image.repository`                                | Pi-hole image repository                                                                                                 | `pihole/pihole` |
| `pihole.image.tag`                                       | Pi-hole image tag (immutable tags are recommended)                                                                       | `2022.05`       |
| `pihole.image.pullPolicy`                                | Pi-hole image pull policy                                                                                                | `IfNotPresent`  |
| `pihole.image.pullSecrets`                               | Pi-hole image pull secrets                                                                                               | `[]`            |
| `pihole.image.debug`                                     | Enable Pi-hole image debug mode                                                                                          | `false`         |
| `pihole.replicaCount`                                    | Number of Pi-hole replicas to deploy                                                                                     | `1`             |
| `pihole.containerPorts.dns`                              | Pi-hole DNS container port                                                                                               | `53`            |
| `pihole.containerPorts.http`                             | Pi-hole HTTP container port                                                                                              | `80`            |
| `pihole.containerPorts.dhcp`                             | Pi-hole DHCP container port                                                                                              | `67`            |
| `pihole.containerPorts.dhcpv6`                           | Pi-hole DHCPv6 container port                                                                                            | `547`           |
| `pihole.livenessProbe.enabled`                           | Enable livenessProbe on Pi-hole containers                                                                               | `true`          |
| `pihole.livenessProbe.initialDelaySeconds`               | Initial delay seconds for livenessProbe                                                                                  | `60`            |
| `pihole.livenessProbe.periodSeconds`                     | Period seconds for livenessProbe                                                                                         | `10`            |
| `pihole.livenessProbe.timeoutSeconds`                    | Timeout seconds for livenessProbe                                                                                        | `5`             |
| `pihole.livenessProbe.failureThreshold`                  | Failure threshold for livenessProbe                                                                                      | `10`            |
| `pihole.livenessProbe.successThreshold`                  | Success threshold for livenessProbe                                                                                      | `1`             |
| `pihole.readinessProbe.enabled`                          | Enable readinessProbe on Pi-hole containers                                                                              | `true`          |
| `pihole.readinessProbe.initialDelaySeconds`              | Initial delay seconds for readinessProbe                                                                                 | `60`            |
| `pihole.readinessProbe.periodSeconds`                    | Period seconds for readinessProbe                                                                                        | `10`            |
| `pihole.readinessProbe.timeoutSeconds`                   | Timeout seconds for readinessProbe                                                                                       | `5`             |
| `pihole.readinessProbe.failureThreshold`                 | Failure threshold for readinessProbe                                                                                     | `5`             |
| `pihole.readinessProbe.successThreshold`                 | Success threshold for readinessProbe                                                                                     | `1`             |
| `pihole.startupProbe.enabled`                            | Enable startupProbe on Pi-hole containers                                                                                | `false`         |
| `pihole.startupProbe.initialDelaySeconds`                | Initial delay seconds for startupProbe                                                                                   | `60`            |
| `pihole.startupProbe.periodSeconds`                      | Period seconds for startupProbe                                                                                          | `10`            |
| `pihole.startupProbe.timeoutSeconds`                     | Timeout seconds for startupProbe                                                                                         | `5`             |
| `pihole.startupProbe.failureThreshold`                   | Failure threshold for startupProbe                                                                                       | `20`            |
| `pihole.startupProbe.successThreshold`                   | Success threshold for startupProbe                                                                                       | `1`             |
| `pihole.customLivenessProbe`                             | Custom livenessProbe that overrides the default one                                                                      | `{}`            |
| `pihole.customReadinessProbe`                            | Custom readinessProbe that overrides the default one                                                                     | `{}`            |
| `pihole.customStartupProbe`                              | Custom startupProbe that overrides the default one                                                                       | `{}`            |
| `pihole.resources.limits.memory`                         | RAM limit for Pi-hole Pod                                                                                                | `512Mi`         |
| `pihole.resources.limits.cpu`                            | CPU limit for Pi-hole Pod                                                                                                | `250m`          |
| `pihole.resources.requests.memory`                       | Request RAM amount for Pi-hole Pod                                                                                       | `256Mi`         |
| `pihole.resources.requests.cpu`                          | The Requested CPU amount for Pi-hole Pod                                                                                 | `100m`          |
| `pihole.podSecurityContext.enabled`                      | Enabled Pi-hole pods' Security Context                                                                                   | `false`         |
| `pihole.podSecurityContext.fsGroup`                      | Set Pi-hole pod's Security Context fsGroup                                                                               | `1001`          |
| `pihole.containerSecurityContext.enabled`                | Enabled Pi-hole containers' Security Context                                                                             | `false`         |
| `pihole.containerSecurityContext.runAsUser`              | Set Pi-hole containers' Security Context runAsUser                                                                       | `1001`          |
| `pihole.containerSecurityContext.runAsNonRoot`           | Set Pi-hole containers' Security Context runAsNonRoot                                                                    | `true`          |
| `pihole.containerSecurityContext.readOnlyRootFilesystem` | Set Pi-hole containers' Security Context runAsNonRoot                                                                    | `false`         |
| `pihole.existingConfigmap`                               | The name of an existing ConfigMap with your custom configuration for pi-hole                                             | `nil`           |
| `pihole.command`                                         | Override default container command (useful when using custom images)                                                     | `[]`            |
| `pihole.args`                                            | Override default container args (useful when using custom images)                                                        | `[]`            |
| `pihole.hostAliases`                                     | Pi-hole pods host aliases                                                                                                | `[]`            |
| `pihole.podLabels`                                       | Extra labels for Pi-hole pods                                                                                            | `{}`            |
| `pihole.podAnnotations`                                  | Annotations for Pi-hole pods                                                                                             | `{}`            |
| `pihole.podAffinityPreset`                               | Pod affinity preset. Ignored if `pihole.affinity` is set. Allowed values: `soft` or `hard`                               | `""`            |
| `pihole.podAntiAffinityPreset`                           | Pod anti-affinity preset. Ignored if `pihole.affinity` is set. Allowed values: `soft` or `hard`                          | `soft`          |
| `pihole.pdb.create`                                      | Enable/disable a Pod Disruption Budget creation                                                                          | `false`         |
| `pihole.pdb.minAvailable`                                | Minimum number/percentage of pods that should remain scheduled                                                           | `1`             |
| `pihole.pdb.maxUnavailable`                              | Maximum number/percentage of pods that may be made unavailable                                                           | `""`            |
| `pihole.autoscaling.enabled`                             | Enable autoscaling for pihole                                                                                            | `false`         |
| `pihole.autoscaling.minReplicas`                         | Minimum number of pihole replicas                                                                                        | `""`            |
| `pihole.autoscaling.maxReplicas`                         | Maximum number of pihole replicas                                                                                        | `""`            |
| `pihole.autoscaling.targetCPU`                           | Target CPU utilization percentage                                                                                        | `""`            |
| `pihole.autoscaling.targetMemory`                        | Target Memory utilization percentage                                                                                     | `""`            |
| `pihole.nodeAffinityPreset.type`                         | Node affinity preset type. Ignored if `pihole.affinity` is set. Allowed values: `soft` or `hard`                         | `""`            |
| `pihole.nodeAffinityPreset.key`                          | Node label key to match. Ignored if `pihole.affinity` is set                                                             | `""`            |
| `pihole.nodeAffinityPreset.values`                       | Node label values to match. Ignored if `pihole.affinity` is set                                                          | `[]`            |
| `pihole.affinity`                                        | Affinity for Pi-hole pods assignment                                                                                     | `{}`            |
| `pihole.nodeSelector`                                    | Node labels for Pi-hole pods assignment                                                                                  | `{}`            |
| `pihole.tolerations`                                     | Tolerations for Pi-hole pods assignment                                                                                  | `[]`            |
| `pihole.updateStrategy.type`                             | Pi-hole statefulset strategy type                                                                                        | `RollingUpdate` |
| `pihole.podManagementPolicy`                             | Statefulset Pod management policy, it needs to be Parallel to be able to complete the cluster join                       | `OrderedReady`  |
| `pihole.priorityClassName`                               | Pi-hole pods' priorityClassName                                                                                          | `""`            |
| `pihole.topologySpreadConstraints`                       | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template | `{}`            |
| `pihole.schedulerName`                                   | Name of the k8s scheduler (other than default) for Pi-hole pods                                                          | `""`            |
| `pihole.terminationGracePeriodSeconds`                   | Seconds Redmine pod needs to terminate gracefully                                                                        | `""`            |
| `pihole.lifecycleHooks`                                  | for the Pi-hole container(s) to automate configuration before or after startup                                           | `{}`            |
| `pihole.extraEnvVars`                                    | Array with extra environment variables to add to Pi-hole nodes                                                           | `[]`            |
| `pihole.extraEnvVarsCM`                                  | Name of existing ConfigMap containing extra env vars for Pi-hole nodes                                                   | `""`            |
| `pihole.extraEnvVarsSecret`                              | Name of existing Secret containing extra env vars for Pi-hole nodes                                                      | `""`            |
| `pihole.extraVolumes`                                    | Optionally specify extra list of additional volumes for then Pi-hole pod(s)                                              | `[]`            |
| `pihole.extraVolumeMounts`                               | Optionally specify extra list of additional volumeMounts for then Pi-hole container(s)                                   | `[]`            |
| `pihole.sidecars`                                        | Add additional sidecar containers to then Pi-hole pod(s)                                                                 | `{}`            |
| `pihole.initContainers`                                  | Add additional init containers to then Pi-hole pod(s)                                                                    | `{}`            |


### Service parameters

| Name                               | Description                                                                        | Value       |
| ---------------------------------- | ---------------------------------------------------------------------------------- | ----------- |
| `service.type`                     | Pi-hole service type                                                               | `ClusterIP` |
| `service.ports.dns`                | Pi-hole service DNS port                                                           | `53`        |
| `service.ports.http`               | Pi-hole service HTTP port                                                          | `80`        |
| `service.nodePorts.dns`            | Node port for DNS                                                                  | `""`        |
| `service.nodePorts.http`           | Node port for HTTP                                                                 | `""`        |
| `service.clusterIP`                | Pi-hole service Cluster IP                                                         | `""`        |
| `service.loadBalancerIP`           | Pi-hole service Load Balancer IP                                                   | `""`        |
| `service.loadBalancerSourceRanges` | Pi-hole service Load Balancer sources                                              | `[]`        |
| `service.externalTrafficPolicy`    | Pi-hole service external traffic policy                                            | `Cluster`   |
| `service.annotations`              | Additional custom annotations for Pi-hole service                                  | `{}`        |
| `service.extraPorts`               | Extra ports to expose in Pi-hole service (normally used with the `sidecars` value) | `[]`        |
| `service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin                   | `None`      |
| `service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                        | `{}`        |


### Persistence parameters

| Name                        | Description                                                                                             | Value               |
| --------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------- |
| `persistence.enabled`       | Enable persistence using Persistent Volume Claims                                                       | `true`              |
| `persistence.mountPath`     | Path to mount the volume at.                                                                            | `/etc/pihole`       |
| `persistence.subPath`       | The subdirectory of the volume to mount to, useful in dev environments and one PV for multiple services | `""`                |
| `persistence.storageClass`  | Storage class of backing PVC                                                                            | `""`                |
| `persistence.annotations`   | Persistent Volume Claim annotations                                                                     | `{}`                |
| `persistence.accessModes`   | Persistent Volume Access Modes                                                                          | `["ReadWriteOnce"]` |
| `persistence.size`          | Size of data volume                                                                                     | `4Gi`               |
| `persistence.existingClaim` | The name of an existing PVC to use for persistence                                                      | `""`                |
| `persistence.selector`      | Selector to match an existing Persistent Volume for WordPress data PVC                                  | `{}`                |
| `persistence.dataSource`    | Custom PVC data source                                                                                  | `{}`                |


### Other parameters

| Name                                          | Description                                                      | Value  |
| --------------------------------------------- | ---------------------------------------------------------------- | ------ |
| `serviceAccount.create`                       | Specifies whether a ServiceAccount should be created             | `true` |
| `serviceAccount.name`                         | The name of the ServiceAccount to use.                           | `""`   |
| `serviceAccount.annotations`                  | Additional Service Account annotations (evaluated as a template) | `{}`   |
| `serviceAccount.automountServiceAccountToken` | Automount service account token for the server service account   | `true` |


Specify each parameter using the `--set key=value[,key=value]` argument to
`helm install`. For example,

```console
helm install my-release \
  --set pihole.webui.admin.email="myemail@provider.com" \
  --set pihole.dnssec.enabled=true \
  savepointsam/pihole
```

The above command sets the Pi-hole web UI admin email as `myemail@provider.com`
and enables DNSSEC.

Alternatively, a YAML file that specifies the values for the above parameters
can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml savepointsam/pihole
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment.
This ensures your deployment does not change automatically if the same tag is
updated with a different image.

### Additional environment variables

In case you want to add extra environment variables (useful for advanced
operations like custom init scripts), you can use the `extraEnvVars` property.

```yaml
pihole:
  extraEnvVars:
    - name: LOG_LEVEL
      value: error
```

Alternatively, you can use a ConfigMap or a Secret with the environment
variables. To do so, use the `extraEnvVarsCM` or the `extraEnvVarsSecret`
values.

### Sidecars

If additional containers are needed in the same pod as Pi-hole (such as
additional metrics or logging exporters), they can be defined using the
`sidecars` parameter. If these sidecars export extra ports, extra port
definitions can be added using the `service.extraPorts` parameter.

### Pod affinity

This chart allows you to set your custom affinity using the `affinity`
parameter. Find more information about Pod affinity in the
[kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, use one of the preset configurations for pod affinity, pod
anti-affinity, and node affinity available at the
[bitnami/common](https://github.com/bitnami/charts/tree/master/bitnami/common#affinities)
chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or
`nodeAffinityPreset` parameters.

## Troubleshooting

Find more information about how to deal with common errors related to Helm
charts in
[this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).
