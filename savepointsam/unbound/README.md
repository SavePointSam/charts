# unbound

Unbound is a validating, recursive, caching DNS resolver. It is designed to be
fast and lean and incorporates modern features based on open standards. You can
learn more about Unbound by reading their
[documentation](https://unbound.docs.nlnetlabs.nl/).

## TL;DR

```console
$ helm repo add savepointsam https://savepointsam.github.io/charts
$ helm install my-release savepointsam/unbound
```

## Introduction

This chart bootstraps a [unbound](https://github.com/NLnetLabs/unbound)
deployment on a [Kubernetes](https://kubernetes.io) cluster using the
[Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.20+
- Helm 3.2.0+

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release savepointsam/unbound
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

### Unbound Parameters

| Name                                                      | Description                                                                                                                       | Value                                                                                    |
| --------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `unbound.verbosity`                                       | Logging severity from 0-5 (0 = no logs)                                                                                           | `1`                                                                                      |
| `unbound.numThreads`                                      | The number of threads to create to serve clients (1 = no threading)                                                               | `1`                                                                                      |
| `unbound.port`                                            | The port number, default 53, on which the server responds to queries.                                                             | `53`                                                                                     |
| `unbound.interface`                                       | Interface to use to connect to the network.                                                                                       | `0.0.0.0@53`                                                                             |
| `unbound.accessControlRules`                              | List of IP netblocks and control action (e.g: deny, refuse, allow, allow_setrd, allow_snoop, deny_non_local, or refuse_non_local) | `["127.0.0.1/32 allow","192.168.0.0/16 allow","172.16.0.0/12 allow","10.0.0.0/8 allow"]` |
| `unbound.forwardingAddresses`                             | List of IP addresses for the server to forward to                                                                                 | `["1.1.1.1@853#cloudflare-dns.com","1.0.0.1@853#cloudflare-dns.com"]`                    |
| `unbound.image.registry`                                  | Unbound image registry                                                                                                            | `docker.io`                                                                              |
| `unbound.image.repository`                                | Unbound image repository                                                                                                          | `savepointsam/unbound`                                                                   |
| `unbound.image.tag`                                       | Unbound image tag (immutable tags are recommended)                                                                                | `1.15.0`                                                                                 |
| `unbound.image.pullPolicy`                                | Unbound image pull policy                                                                                                         | `IfNotPresent`                                                                           |
| `unbound.image.pullSecrets`                               | Unbound image pull secrets                                                                                                        | `[]`                                                                                     |
| `unbound.image.debug`                                     | Enable Unbound image debug mode                                                                                                   | `false`                                                                                  |
| `unbound.replicaCount`                                    | Number of Unbound replicas to deploy                                                                                              | `1`                                                                                      |
| `unbound.containerPorts.dns`                              | Unbound DNS container port                                                                                                        | `53`                                                                                     |
| `unbound.livenessProbe.enabled`                           | Enable livenessProbe on Unbound containers                                                                                        | `true`                                                                                   |
| `unbound.livenessProbe.initialDelaySeconds`               | Initial delay seconds for livenessProbe                                                                                           | `30`                                                                                     |
| `unbound.livenessProbe.periodSeconds`                     | Period seconds for livenessProbe                                                                                                  | `10`                                                                                     |
| `unbound.livenessProbe.timeoutSeconds`                    | Timeout seconds for livenessProbe                                                                                                 | `5`                                                                                      |
| `unbound.livenessProbe.failureThreshold`                  | Failure threshold for livenessProbe                                                                                               | `10`                                                                                     |
| `unbound.livenessProbe.successThreshold`                  | Success threshold for livenessProbe                                                                                               | `1`                                                                                      |
| `unbound.readinessProbe.enabled`                          | Enable readinessProbe on Unbound containers                                                                                       | `true`                                                                                   |
| `unbound.readinessProbe.initialDelaySeconds`              | Initial delay seconds for readinessProbe                                                                                          | `30`                                                                                     |
| `unbound.readinessProbe.periodSeconds`                    | Period seconds for readinessProbe                                                                                                 | `10`                                                                                     |
| `unbound.readinessProbe.timeoutSeconds`                   | Timeout seconds for readinessProbe                                                                                                | `5`                                                                                      |
| `unbound.readinessProbe.failureThreshold`                 | Failure threshold for readinessProbe                                                                                              | `5`                                                                                      |
| `unbound.readinessProbe.successThreshold`                 | Success threshold for readinessProbe                                                                                              | `1`                                                                                      |
| `unbound.startupProbe.enabled`                            | Enable startupProbe on Unbound containers                                                                                         | `false`                                                                                  |
| `unbound.startupProbe.initialDelaySeconds`                | Initial delay seconds for startupProbe                                                                                            | `30`                                                                                     |
| `unbound.startupProbe.periodSeconds`                      | Period seconds for startupProbe                                                                                                   | `10`                                                                                     |
| `unbound.startupProbe.timeoutSeconds`                     | Timeout seconds for startupProbe                                                                                                  | `5`                                                                                      |
| `unbound.startupProbe.failureThreshold`                   | Failure threshold for startupProbe                                                                                                | `20`                                                                                     |
| `unbound.startupProbe.successThreshold`                   | Success threshold for startupProbe                                                                                                | `1`                                                                                      |
| `unbound.customLivenessProbe`                             | Custom livenessProbe that overrides the default one                                                                               | `{}`                                                                                     |
| `unbound.customReadinessProbe`                            | Custom readinessProbe that overrides the default one                                                                              | `{}`                                                                                     |
| `unbound.customStartupProbe`                              | Custom startupProbe that overrides the default one                                                                                | `{}`                                                                                     |
| `unbound.resources.requests.memory`                       | The requested memory for the Unbound containers                                                                                   | `32Mi`                                                                                   |
| `unbound.resources.requests.cpu`                          | The requested CPU for the Unbound containers                                                                                      | `100m`                                                                                   |
| `unbound.podSecurityContext.enabled`                      | Enabled Unbound pods' Security Context                                                                                            | `false`                                                                                  |
| `unbound.podSecurityContext.fsGroup`                      | Set Unbound pod's Security Context fsGroup                                                                                        | `1001`                                                                                   |
| `unbound.containerSecurityContext.enabled`                | Enabled Unbound containers' Security Context                                                                                      | `false`                                                                                  |
| `unbound.containerSecurityContext.runAsUser`              | Set Unbound containers' Security Context runAsUser                                                                                | `1001`                                                                                   |
| `unbound.containerSecurityContext.runAsNonRoot`           | Set Unbound containers' Security Context runAsNonRoot                                                                             | `true`                                                                                   |
| `unbound.containerSecurityContext.readOnlyRootFilesystem` | Set Unbound containers' Security Context runAsNonRoot                                                                             | `false`                                                                                  |
| `unbound.existingConfigmap`                               | The name of an existing ConfigMap with your custom configuration for unbound                                                      | `nil`                                                                                    |
| `unbound.command`                                         | Override default container command (useful when using custom images)                                                              | `[]`                                                                                     |
| `unbound.args`                                            | Override default container args (useful when using custom images)                                                                 | `[]`                                                                                     |
| `unbound.hostAliases`                                     | Unbound pods host aliases                                                                                                         | `[]`                                                                                     |
| `unbound.podLabels`                                       | Extra labels for Unbound pods                                                                                                     | `{}`                                                                                     |
| `unbound.podAnnotations`                                  | Annotations for Unbound pods                                                                                                      | `{}`                                                                                     |
| `unbound.podAffinityPreset`                               | Pod affinity preset. Ignored if `unbound.affinity` is set. Allowed values: `soft` or `hard`                                       | `""`                                                                                     |
| `unbound.podAntiAffinityPreset`                           | Pod anti-affinity preset. Ignored if `unbound.affinity` is set. Allowed values: `soft` or `hard`                                  | `soft`                                                                                   |
| `unbound.pdb.create`                                      | Enable/disable a Pod Disruption Budget creation                                                                                   | `false`                                                                                  |
| `unbound.pdb.minAvailable`                                | Minimum number/percentage of pods that should remain scheduled                                                                    | `1`                                                                                      |
| `unbound.pdb.maxUnavailable`                              | Maximum number/percentage of pods that may be made unavailable                                                                    | `""`                                                                                     |
| `unbound.autoscaling.enabled`                             | Enable autoscaling for unbound                                                                                                    | `false`                                                                                  |
| `unbound.autoscaling.minReplicas`                         | Minimum number of Unbound replicas                                                                                                | `""`                                                                                     |
| `unbound.autoscaling.maxReplicas`                         | Maximum number of Unbound replicas                                                                                                | `""`                                                                                     |
| `unbound.autoscaling.targetCPU`                           | Target CPU utilization percentage                                                                                                 | `""`                                                                                     |
| `unbound.autoscaling.targetMemory`                        | Target Memory utilization percentage                                                                                              | `""`                                                                                     |
| `unbound.nodeAffinityPreset.type`                         | Node affinity preset type. Ignored if `unbound.affinity` is set. Allowed values: `soft` or `hard`                                 | `""`                                                                                     |
| `unbound.nodeAffinityPreset.key`                          | Node label key to match. Ignored if `unbound.affinity` is set                                                                     | `""`                                                                                     |
| `unbound.nodeAffinityPreset.values`                       | Node label values to match. Ignored if `unbound.affinity` is set                                                                  | `[]`                                                                                     |
| `unbound.affinity`                                        | Affinity for Unbound pods assignment                                                                                              | `{}`                                                                                     |
| `unbound.nodeSelector`                                    | Node labels for Unbound pods assignment                                                                                           | `{}`                                                                                     |
| `unbound.tolerations`                                     | Tolerations for Unbound pods assignment                                                                                           | `[]`                                                                                     |
| `unbound.updateStrategy.type`                             | Unbound statefulset strategy type                                                                                                 | `RollingUpdate`                                                                          |
| `unbound.podManagementPolicy`                             | Statefulset Pod management policy, it needs to be Parallel to be able to complete the cluster join                                | `OrderedReady`                                                                           |
| `unbound.priorityClassName`                               | Unbound pods' priorityClassName                                                                                                   | `""`                                                                                     |
| `unbound.topologySpreadConstraints`                       | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template          | `{}`                                                                                     |
| `unbound.schedulerName`                                   | Name of the k8s scheduler (other than default) for Unbound pods                                                                   | `""`                                                                                     |
| `unbound.terminationGracePeriodSeconds`                   | Seconds Redmine pod needs to terminate gracefully                                                                                 | `""`                                                                                     |
| `unbound.lifecycleHooks`                                  | for the Unbound container(s) to automate configuration before or after startup                                                    | `{}`                                                                                     |
| `unbound.extraEnvVars`                                    | Array with extra environment variables to add to Unbound nodes                                                                    | `[]`                                                                                     |
| `unbound.extraEnvVarsCM`                                  | Name of existing ConfigMap containing extra env vars for Unbound nodes                                                            | `""`                                                                                     |
| `unbound.extraEnvVarsSecret`                              | Name of existing Secret containing extra env vars for Unbound nodes                                                               | `""`                                                                                     |
| `unbound.extraVolumes`                                    | Optionally specify extra list of additional volumes for the Unbound pod(s)                                                        | `[]`                                                                                     |
| `unbound.extraVolumeMounts`                               | Optionally specify extra list of additional volumeMounts for the Unbound container(s)                                             | `[]`                                                                                     |
| `unbound.sidecars`                                        | Add additional sidecar containers to the Unbound pod(s)                                                                           | `{}`                                                                                     |
| `unbound.initContainers`                                  | Add additional init containers to the Unbound pod(s)                                                                              | `{}`                                                                                     |

### Service Parameters

| Name                               | Description                                                                        | Value       |
| ---------------------------------- | ---------------------------------------------------------------------------------- | ----------- |
| `service.type`                     | Unbound service type                                                               | `ClusterIP` |
| `service.ports.dns`                | Unbound service DNS port                                                           | `53`        |
| `service.nodePorts.dns`            | Node port for DNS                                                                  | `""`        |
| `service.clusterIP`                | Unbound service Cluster IP                                                         | `""`        |
| `service.loadBalancerIP`           | Unbound service Load Balancer IP                                                   | `""`        |
| `service.loadBalancerSourceRanges` | Unbound service Load Balancer sources                                              | `[]`        |
| `service.externalTrafficPolicy`    | Unbound service external traffic policy                                            | `Cluster`   |
| `service.annotations`              | Additional custom annotations for Unbound service                                  | `{}`        |
| `service.extraPorts`               | Extra ports to expose in Unbound service (normally used with the `sidecars` value) | `[]`        |
| `service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin                   | `None`      |
| `service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                        | `{}`        |

### Other Parameters

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
  --set port=5335 \
  --set numThreads=2 \
  savepointsam/unbound
```

The above command sets the unbound port to `5335` and the number of threads
unbound uses to `2`.

Alternatively, a YAML file that specifies the values for the above parameters
can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml savepointsam/unbound
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
unbound:
  extraEnvVars:
    - name: LOG_LEVEL
      value: error
```

Alternatively, you can use a ConfigMap or a Secret with the environment
variables. To do so, use the `extraEnvVarsCM` or the `extraEnvVarsSecret`
values.

### Sidecars

If additional containers are needed in the same pod as unbound (such as
additional metrics or logging exporters), they can be defined using the
`sidecars` parameter. If these sidecars export extra ports, extra port
definitions can be added using the `service.extraPorts` parameter.
[Learn more about configuring and using sidecar containers](https://docs.bitnami.com/kubernetes/apps/unbound/administration/configure-use-sidecars/).

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
