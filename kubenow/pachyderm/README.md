Pachyderm Helm Chart
====================

This chart can be used to deploy Pachyderm backed by Gluster-S3, a S3 compliant interface for GlusterFS.

Prerequisites Details
---------------------

-	Default deployment of KubeNow
-   Gluster-S3 deployment on Kubernetes using Helm

As an example, Gluster-S3 can be deployed with Helm by executing:

```console
$ helm install --name s3-interface --set account=<s3-account>,user=<s3-user>,password=<s3-password>,hostNetwork=false,defaultBucket.enabled=true,defaultBucket.name=<s3-bucket> kubenow/gluster-s3
```

How to install the chart
--------------------

In order to inatall the chart, please use the same account, user, password and bucket name previously set in the Gluster-S3 chart. Please note that the glusters3-id must be specified as a combination of the S3 account and user: 

```console
$ helm install --name pachyderm --set glusters3.id=<s3-account>:<s3-user>,glusters3.key=<s3-password>,glusters3.bucketName=<s3-bucket> kubenow/pachyderm
```

Helm chart settings
-------------------

The following tables lists the configurable parameters of the chart and their default values.

| Parameter                | Description           | Default           |
|--------------------------|-----------------------|-------------------|
| `pachd.image.repository` | Container image name  | `pachyderm/pachd` |
| `pachd.image.tag`        | Container image tag   | `1.6.6`           |
| `pachd.worker.repository`| Worker image name     | `pachyderm/worker`|
| `pachd.worker.tag`       | Worker image tag      | `1.6.6`           |
| `pachd.replicaCount`     | Number of pachds      | `1`               |
| `*.resources.memory`     | Memory request        | `2G`              |
| `*.resources.cpu`        | CPU request           | `1`               |
| `etcd.resources.memory`  | Memory request (etcd) | `2G`              |
| `etcd.resources.cpu`     | CPU request (etcd)    | `1`               |
| `dash.enabled`           | Switch for the dash   | `false`           |


Other parameters are also changeable. Please consult all available parameters in the `values.yaml` file.

Accessing the pachd service
-------------------
In order to use Pachyderm, please login through ssh to the master node and install the Pachyderm client:

```console
$ curl -o /tmp/pachctl.deb -L https://github.com/pachyderm/pachyderm/releases/download/v1.6.6/pachctl_1.6.6_amd64.deb && sudo dpkg -i /tmp/pachctl.deb
```

Please note that the client version should correspond with the pachd service version. For more information please consult: http://pachyderm.readthedocs.io/en/latest/index.html

Clean-up
-------

In order to remove the Pachyderm release, you can execute the following commands:

```console
$ helm list
$ helm delete --purge <release-name>
```
