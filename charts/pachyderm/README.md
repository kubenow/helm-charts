Pachyderm Helm Chart
====================

This chart can be used to deploy Pachyderm backed by Minio, a lightweight, AWS S3 compatible object storage server.

Prerequisites Details
---------------------

-	Default deployment of KubeNow
-   Minio deployment on Kubernetes using Helm: https://github.com/kubernetes/charts/tree/master/stable/minio

As an example, Minio can be deployed by using Helm by executing:

```console
$ bin/helm install --name minio-release --set mode=shared,replicas=1,accessKey=myaccesskey,secretKey=mysecretkey,serviceType=ClusterIP,persistence.size=50Gi,persistence.enabled=true stable/minio
```

How to install the chart
--------------------

You should install the chart with the same release name, access key and secret key previously set in the Minio chart:

```console
$ bin/helm repo add charts https://kubenow.github.io/helm-charts/
$ bin/helm install --name pachyderm --set minio.releaseName=minio-release,minio.accessKey=myaccesskey,minio.secretKey=mysecretkey charts/pachyderm
```

Helm chart settings
-------------------

The following tables lists the configurable parameters of the chart and their default values.

| Parameter                | Description           | Default           |
|--------------------------|-----------------------|-------------------|
| `pachd.image.repository` | Container image name  | `pachyderm/pachd` |
| `pachd.image.tag`        | Container image tag   | `1.5.0`           |
| `pachd.worker.repository`| Worker image name     | `pachyderm/worker`|
| `pachd.worker.tag`       | Worker image tag      | `1.5.0`           |
| `pachd.replicaCount`     | Number of pachds      | `1`               |
| `*.resources.memory`     | Memory request        | `5G`              |
| `*.resources.cpu`        | CPU request           | `1`               |
| `minio.accessKey`        | Minio access key      | `myaccesskey`     |
| `minio.secretKey`        | Minio secret key      | `mysecretkey`     |
| `etcd.resources.memory`  | Memory request (etcd) | `4G`              |
| `etcd.resources.cpu`     | CPU request (etcd)    | `1`               |
| `dash.enabled`           | Switch for the dash   | `true`            |
| `dash.httphost`          | http host for dash    | `sv.pachdash`     |
| `dash.grpchost`          | grpc host for dash    | `sv.grpc`         |

Other parameters are also changeable. Please consult all available parameters in the `values.yaml` file.

Clean-up
-------

In order to remove the Pachyderm release, you can execute the following commands:

```console
$ helm list
$ helm delete <release-name>
```
