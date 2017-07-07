Pachyderm-Minio Helm Chart
====================

This chart can be used to deploy Pachyderm backed by Minio, a lightweight, AWS S3 compatible object storage server.

Prerequisites Details
---------------------

-	Kubernetes
-   PV provisioner support in the underlying infrastructure
-   Minio deployment on Kubernetes using Helm


Chart Details
-------------

This chart can do the following:

-	Deploy Pachyderm in any cloud infrastructure with PV provisioner support

How to install the chart
--------------------

You must install the chart with the same release name, access key and secret key previously set in the Minio chart:

```console
$ helm repo add charts https://kubenow.github.io/helm-charts/
$ helm install --name pachyderm --set minio.releaseName=minio-release,minio.accessKey=myaccesskey,minio.secretKey=mysecretkey charts/pachyderm
```

Helm chart settings
-------------------

The following tables lists the configurable parameters of the chart and their default values.

| Parameter                | Description           | Default           |
|--------------------------|-----------------------|-------------------|
| `pachd.image.repository` | Container image name  | `pachyderm/pachd` |
| `pachd.image.tag`        | Container image tag   | `1.4.8`           |
| `pachd.worker.repository`| Worker image name     | `pachyderm/worker`|
| `pachd.worker.tag`       | Worker image tag      | `1.4.8`           |
| `pachd.replicaCount`     | Number of pachds      | `1`               |
| `*.resources.memory`     | Memory request        | `5G`              |
| `*.resources.cpu`        | CPU request           | `1`               |
| `minio.accessKey`        | Minio access key      | `myaccesskey`     |
| `minio.secretKey`        | Minio secret key      | `mysecretkey`     |


Other parameters are also changeable. Please consult all available parameters in the `values.yaml` file.

Clean-up
-------

In order to remove everything, you can execute the following commands:

```console
$ helm list
$ helm delete <release-name>
```
