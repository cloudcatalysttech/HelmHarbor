# HelmHarbor

HelmHarbor is an opinionated, reusable Helm chart designed to simplify Kubernetes deployments by abstracting common configurations and resources. It is built for internal use at Creative and aims to support the majority of typical deployment scenarios.

---

## 📦 Chart Info

- **Name**: `helmharbor`
- **Version**: `0.1.0`
- **Chart Type**: Application
- **Maintainer**: Creative Tech Team
- **Registry**: `ghcr.io/cloudcatalysttech`

---

## 🚀 Features

- Deployment, DaemonSet, or StatefulSet-based workloads
- Configurable autoscaling (CPU/memory based)
- Optional rolling updates
- Ingress support with ALB annotations
- Support for secrets and configmaps
- Custom init containers and lifecycle hooks
- Full affinity/toleration/nodeSelector support
- Graceful shutdown (`terminationGracePeriodSeconds`)
- Custom service types and ports

---

## 🔧 Configuration

Example values (`values.yaml`) include:

```yaml
replicaCount: 1
autoscaling:
  enabled: true
  cpu:
    enabled: true
    percentage: 60
  memory:
    enabled: false
    percentage: 60
  min_replicas: 1
  max_replicas: 2

deployment:
  enabled: true
  alwaysRestartPodsOnDeployment: true

daemonset:
  enabled: false

statefulSet:
  enabled: false

service:
  enabled: true
  type: ClusterIP

terminationGracePeriodSeconds: 30

podDisruptionBudget:
  maxUnavailable: "10%"
```

---

## 🛠️ Usage

### Installation

```bash
helm repo add helmharbor oci://ghcr.io/cloudcatalysttech
helm install my-release helmharbor/helmharbor
```

Or to install from a local chart:

```bash
helm install my-release ./helmharbor-0.1.0.tgz
```

### Customization

You can override any value in `values.yaml`:

```bash
helm install my-release ./helmharbor-0.1.0.tgz \
  --set deployment.enabled=true \
  --set autoscaling.enabled=false
```

---

## 📚 Documentation

More detailed documentation can be found at:
[Using HelmHarbor](https://ttechteam.atlassian.net/wiki/x/GQCKeg)

---

## 🤝 Contributing

Everyone is welcome to contribute. When submitting changes:

- Include `values.yaml` examples
- Justify the change in your PR
- Keep the chart focused on common scenarios

---

## 🏷️ Publishing a New Version

1. Update `version` in `Chart.yaml`
2. Add changelog entry
3. Commit and push

To publish:

```bash
make publish
```

---

## 🧹 Cleanup

```bash
make clean
```

---

## 📜 Changelog

**v1.0.0**

- Initial chart version

**v1.1.0**

- Added support for secret object

---

## 🧭 Template Overview

This Helm chart provides an opinionated scaffold for deploying a wide variety of Kubernetes workloads.

### Template Breakdown

- **`deployment.yaml`**: Standard Deployment controller with autoscaling, lifecycle hooks, and restart support
- **`daemonset.yaml`**: DaemonSet controller for node-specific workloads
- **`statefulset.yaml`**: Stable network identity and persistent storage via StatefulSets
- **`hpa.yaml`**: Autoscaling policies
- **`service.yaml`**: Network exposure with multiple ports and types
- **`ingress.yaml`, `overriden_ingress.yaml`**: Flexible ingress rules and annotations (ALB, SSL, path-based routing)
- **`pdb.yaml`**: Pod disruption budget for HA
- **`serviceaccount.yaml`**: Optional service account
- **`secret.yaml`, `configmap.yaml`**: Secure and plain key-value configurations
- **`_helpers.tpl`**: Naming and label helpers