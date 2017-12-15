Pachyderm Helm Chart
====================

This chart can be used to deploy Pachyderm on different Cloud providers.

Prerequisites Details
---------------------

-	Dynamic provisioning of PVs

General chart settings
----------------------

The following table lists the configurable parameters of `pachd` and their default values:

| Parameter                | Description           | Default           |
|--------------------------|-----------------------|-------------------|
| `pachd.image.repository` | Container image name  | `pachyderm/pachd` |
| `*.image.tag`            | Container image tag   | `1.6.6`           |
| `*.worker.repository`    | Worker image name     | `pachyderm/worker`|
| `*.worker.tag`           | Worker image tag      | `1.6.6`           |
| `*.replicaCount`         | Number of pachds      | `1`               |
| `*.resources.memory`     | Memory request        | `2G`              |
| `*.resources.cpu`        | CPU request           | `1`               |


Next table lists the configurable parameters of `etcd` and their default values:

| Parameter                | Description           | Default           |
|--------------------------|-----------------------|-------------------|
| `etcd.resources.memory`  | Memory request        | `2G`              |
| `*.*.cpu`                | CPU request           | `1`               |
| `*.volumeClaim.storage`  | Storage request       | `20`              |
| `*.*.accessModes`        | Access mode for PV    | `ReadWriteMany`   |


Storage backend settings
------------------------

In order to set which object store credentials you want to use, please set the flag `credentials` with one of the following values: `s3 | google | amazon | microsoft`.

| Parameter                | Description           | Default           |
|--------------------------|-----------------------|-------------------|
| `credentials`            | Backend credentials   | ""                |


Based on the storage credentials used, fill in the corresponding parameters in the `values.yaml` file.

With `S3` credentials, these are the configurable parameters:

| Parameter                | Description           | Default           |
|--------------------------|-----------------------|-------------------|
| `s3.accessKey`           | S3 access key         | `""`              |
| `s3.secretKey`           | S3 secret key         | `""`              |
| `s3.bucketName`          | S3 bucket name        | `""`              |
| `s3.endpoint`            | S3 endpoint           | `""`              |
| `s3.secure`              | S3 secure             | `""`              |
| `s3.signature`           | S3 signature          | `""`              |


With `Google Cloud` credentials, you must define your `GCS bucket name`:

| Parameter                | Description           | Default           |
|--------------------------|-----------------------|-------------------|
| `google.bucketName`      | GCS bucket name       | `""`              |


On `Amazon Web Services`, please set the next values:

| Parameter                | Description           | Default           |
|--------------------------|-----------------------|-------------------|
| `amazon.bucketName`      | Amazon bucket name    | `""`              |
| `amazon.distribution`    | Amazon distribution   | `""`              |
| `amazon.id`              | Amazon id             | `""`              |
| `amazon.region`          | Amazon region         | `""`              |
| `amazon.secret`          | Amazon secret         | `""`              |
| `amazon.token`           | Amazon token          | `""`              |


As for `Microsoft Azure`, you must specify the following parameters:

| Parameter                | Description           | Default           |
|--------------------------|-----------------------|-------------------|
| `microsoft.container`    | Container             | `""`              |
| `microsoft.id`           | Account name          | `""`              |
| `microsoft.secret`       | Account key           | `""`              |


How to install the chart
------------------------

You should install the chart specifying each parameter using the `--set key=value[,key=value]` argument to helm install.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart:

```console
$ helm repo add kubenow https://kubenow.github.io/helm-charts/
$ helm install --name pachyderm -f values.yaml kubenow/pachyderm
```

Accessing the pachd service
---------------------------

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
