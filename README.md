![logo](https://github.com/kubenow/KubeNow/blob/master/img/logo_wide_50dpi.png)

This repository contains Helm packages that are tested and maintained by the KubeNow community. The packages are hosted by GitHub pages, and we provide a fully automated release of charts using Travis CI.

[![Build Status](https://travis-ci.org/kubenow/helm-charts.svg?branch=master)](https://travis-ci.org/kubenow/helm-charts)

## Getting started

To be able to deploy Helm charts from this repository outside of a KubeNow cluster, you should first run the following command:

```console
$ helm repo add kubenow https://kubenow.github.io/helm-charts/
```

In a KubeNow cluster this repo should be added by default.
