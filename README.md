![logo](https://github.com/kubenow/KubeNow/blob/master/img/logo_wide_50dpi.png)

Collection of Helm Charts and repository for easy packaging and deployment of applications. 

[![Build Status](https://travis-ci.org/kubenow/helm-charts.svg?branch=master)](https://travis-ci.org/kubenow/helm-charts)

## Helm Charts

Helm can be used in KubeNow as a package manager to deploy applications. The home for these packages (called Charts in Helm) is the gh-pages branch of this GitHub repository, while in the master branch you can find the definition of the different Helm charts. Specifically, we provide a Helm chart repository hosted using GH pages with a fully automated release of Charts using Travis CI.

To be able to deploy Helm charts from this repository, you should execute the following command:

```console
$ bin/helm repo add charts https://kubenow.github.io/helm-charts/
```

You can also consult your available Helm packages via:

```console
$ bin/helm search
```
