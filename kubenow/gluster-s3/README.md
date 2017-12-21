Gluster-S3 Helm Chart
=====================

This chart can be used to deploy Gluster-S3, a S3 object storage interface for GlusterFS.

Helm chart settings and deployment
----------------------------------

The following tables lists the configurable parameters of the chart and their default values.

| Parameter                    | Description           | Default                 |
|------------------------------|-----------------------|-------------------------|
| `image`                      | Default image name    | `gluster/gluster-object`|
| `imageTag`                   | Default image tag     | `latest`                |
| `imagePullPolicy`            | Default pull policy   | `IfNotPresent`          |
| `account`                    | S3 account            | `""`                    |
| `user`                       | S3 user               | `""`                    |
| `password`                   | S3 password           | `""`                    |
| `defaultBucket.enabled`      | S3 bucket creation    | `false`                 |
| `defaultBucket.name`         | S3 bucket name        | `defaultBucket`        |
| `mainPvcRequest`             | Main PVC request      | `120Gi`                 |
| `metaPvcRequest`             | Meta PVC request      | `10Gi`                  |
| `hostNetwork`                | How to expose the svc | `false`                 |


This service can be deployed with default settings via Helm using a simple command. You must deploy by setting a `S3 account`, `user` and `password`. It is strongly recommended that these contain more than 6 characters. You should install the chart specifying each parameter using the `--set key=value[,key=value]` argument to helm install. Please consult the `values.yaml` file for more information regarding the parameters. For example:


```console
$ helm install --name s3-interface --set account=<account>,user=<user>,password=<password>,hostNetwork=false,defaultBucket.enabled=<true|false>,defaultBucket.name=<bucketName> kubenow/gluster-s3
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart:

```console
$ helm install --name my-release -f values.yaml kubenow/gluster-s3
```


Clean-up
--------

In order to remove Gluster-S3, you can execute the following commands:

```console
$ helm list
$ helm delete <release-name> --purge
```
