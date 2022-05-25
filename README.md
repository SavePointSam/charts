# SavePointSam/charts

[![Release Charts](https://github.com/SavePointSam/charts/actions/workflows/release.yaml/badge.svg)](https://github.com/SavePointSam/charts/actions/workflows/release.yaml)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/savepointsam&style=plastic&labelColor=131216&color=222529)](https://artifacthub.io/packages/search?repo=savepointsam)

Collection of charts developed for personal use. Charts follow
[Bitnami](https://github.com/bitnami/charts) patterns.

## TL;DR

```bash
$ helm repo add savepointsam https://savepointsam.github.io/charts
$ helm search repo savepointsam
$ helm install my-release savepointsam/<chart>
```

## Before you begin

### Prerequisites

- Kubernetes 1.20+
- Helm 3.2.0+

### Setup a Kubernetes Cluster

For setting up Kubernetes refer to the Kubernetes
[getting started guide](https://kubernetes.io/docs/getting-started-guides/).

### Install Helm

Helm is a tool for managing Kubernetes charts. Charts are packages of
pre-configured Kubernetes resources.

To install Helm, refer to the
[Helm install guide](https://github.com/helm/helm#install) and ensure that the
`helm` binary is in the `PATH` of your shell.

### Add Repo

The following command allows you to download and install all the charts from
this repository:

```bash
$ helm repo add savepointsam https://savepointsam.github.io/charts
```

### Using Helm

Once you have installed the Helm client, you can deploy a Helm Chart into a
Kubernetes cluster.

Please refer to the [Quick Start guide](https://helm.sh/docs/intro/quickstart/)
if you wish to get running in just a few commands, otherwise the
[Using Helm Guide](https://helm.sh/docs/intro/using_helm/) provides detailed
instructions on how to use the Helm client to manage packages on your Kubernetes
cluster.

Useful Helm Client Commands:

- View available charts: `helm search repo`
- Install a chart: `helm install my-release savepointsam/<package-name>`
- Upgrade your application: `helm upgrade`

## Available Charts

Charts contained in this repo can by found [here](./savepointsam). Charts can
also be browsed on
[Artifact Hub](https://artifacthub.io/packages/search?repo=savepointsam).
