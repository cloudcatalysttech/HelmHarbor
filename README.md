# HelmHarbor

An opinionated Helm chart offered to all teams across Creative to make their life easier by abstracting away typical resources created on K8s.

Documentation for using HelmHarbor [Using HelmHarbor](https://ttechteam.atlassian.net/wiki/x/GQCKeg).


## Contributing
Everyone is welcomed to contribute to HelmHarbor. However, not all contributions are accepted right away as the aim is not to create a huge chart that covers every corner case but instead maintain one that can help the majority of use cases while expecting teams can potentially create subcharts on top of HelmHarbor to cover corner use cases.

In general, any new changes in templates should be accompanied by at least a comment in the `values.yaml` demonstrating the intended usage and also proper reasoning in the PR body about the background story for these changes.

### Publishing a new version

1. Increment `version` in `Chart.yaml`
2. Add new version to the CHANGELOG section below
3. Commit and push to Bitbucket

### Changelog

**Version 1.0.0**  
- Inital chart version.

**Version 1.1.0**  
- Adeed support of secret object

