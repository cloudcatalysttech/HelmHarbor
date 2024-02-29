
# HelmHarbor

HelmHarbor offers a centralized Helm chart management solution designed to simplify the deployment and management of Helm charts across Kubernetes clusters. This opinionated Helm chart is crafted to assist teams in managing their applications with ease, abstracting away the complexity of Kubernetes resource creation and management.

## Features

- Centralized management of Helm charts
- Streamlined deployment processes
- Access control for chart management
- Version control for rollback and history tracking
- Support for automated updates, PVCs, DaemonSets, StatefulSets, Ingress, and green/blue deployments

## Contributing

Contributions to HelmHarbor are welcome! We aim to keep the chart general enough to cover the majority of use cases, facilitating most teams while allowing for the creation of subcharts for specific needs.

When contributing:
- Ensure that any changes to templates are documented in the `values.yaml` file, including usage examples.
- Provide thorough explanations for your changes in the pull request to help maintainers understand the purpose of your contribution.

### Publishing a New Version

1. Increment the `version` in `Chart.yaml`.
2. Document the changes in the CHANGELOG section below.
3. Commit and push your changes.

### Changelog

**Version 1.0.0**  
- Initial chart version, featuring core functionalities for Helm chart management within Kubernetes environments.

### Getting Started

To use HelmHarbor, clone this repository and install the Helm chart in your Kubernetes cluster with:

```shell
helm install helmharbor ./helmharbor
```

Make sure to configure the `values.yaml` according to your cluster setup and requirements.

For detailed instructions, refer to the [Installation Guide](#) and the [Configuration Documentation](#).

---

HelmHarbor is an evolving project, and we are excited to see how it grows with contributions from the community. Join us in simplifying Kubernetes deployments with efficient Helm chart management.
