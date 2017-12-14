Pachyderm Helm Chart
====================

This chart can be used to deploy Pachyderm backed by Minio, a lightweight AWS S3 compatible object storage server.

Prerequisites Details
---------------------

-	Default deployment of KubeNow
-   Minio deployment on Kubernetes using Helm: https://github.com/kubernetes/charts/tree/master/stable/minio

As an example, Minio can be deployed by using Helm by executing:

```console
$ helm install --name minio-release --set mode=shared,replicas=3,accessKey=myaccesskey,secretKey=mysecretkey,serviceType=ClusterIP,persistence.size=50Gi,persistence.enabled=true stable/minio
```

How to install the chart
--------------------

You should install the chart with the same release name, access key and secret key previously set in the Minio chart:

```console
$ helm repo add kubenow https://kubenow.github.io/helm-charts/
$ helm install --name pachyderm --set minio.releaseName=minio-release,minio.accessKey=myaccesskey,minio.secretKey=mysecretkey kubenow/pachyderm
```

Helm chart settings
-------------------

The following tables lists the configurable parameters of the chart and their default values.

| Parameter                | Description           | Default           |
|--------------------------|-----------------------|-------------------|
| `pachd.image.repository` | Container image name  | `pachyderm/pachd` |
| `pachd.image.tag`        | Container image tag   | `1.6.5`           |
| `pachd.worker.repository`| Worker image name     | `pachyderm/worker`|
| `pachd.worker.tag`       | Worker image tag      | `1.6.5`           |
| `pachd.replicaCount`     | Number of pachds      | `1`               |
| `*.resources.memory`     | Memory request        | `2G`              |
| `*.resources.cpu`        | CPU request           | `1`               |
| `minio.accessKey`        | Minio access key      | `myaccesskey`     |
| `minio.secretKey`        | Minio secret key      | `mysecretkey`     |
| `etcd.resources.memory`  | Memory request (etcd) | `2G`              |
| `etcd.resources.cpu`     | CPU request (etcd)    | `1`               |
| `dash.enabled`           | Switch for the dash   | `false`           |


Other parameters are also changeable. Please consult all available parameters in the `values.yaml` file.

Accessing the pachd service
-------------------
In order to use Pachyderm, please login through ssh to the master node and install the Pachyderm client:

```console
$ curl -o /tmp/pachctl.deb -L https://github.com/pachyderm/pachyderm/releases/download/v1.6.5/pachctl_1.6.5_amd64.deb && sudo dpkg -i /tmp/pachctl.deb
```

Please note that the client version should correspond with the pachd service version. For more information please consult: http://pachyderm.readthedocs.io/en/latest/index.html

Clean-up
-------

In order to remove the Pachyderm release, you can execute the following commands:

```console
$ helm list
$ helm delete --purge <release-name>
```
