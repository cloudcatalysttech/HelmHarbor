# Unit Tests for HelmHarbor

This folder contains unittest for the HelmHarbor helm chart.

* autoscaling_cpu_and_memory_test.yaml - ensure the chart renders for using `cpu` and `memory` for the HPA controller and assert expected config
* autoscaling_cpu_only_test.yaml - ensure the chart renders just for `cpu` for HPA controller and assert expected config

### Helm unittest tool can be install using

```
helm plugin install https://github.com/quintush/helm-unittest
```

### Running the test.

Within the HelmHarbor toplevel directory run the following command `helm unittest -3  .`

#### Example output
```
### Chart [ HelmHarbor ] .

 PASS  test HelmHarbor hpa cpu and memory	tests/autoscaling_cpu_and_memory_test.yaml
 PASS  test HelmHarbor hpa cpu only	tests/autoscaling_cpu_only_test.yaml

Charts:      1 passed, 1 total
Test Suites: 3 passed, 3 total
Tests:       3 passed, 3 total
Snapshot:    0 passed, 0 total
Time:        16.778598ms
```
