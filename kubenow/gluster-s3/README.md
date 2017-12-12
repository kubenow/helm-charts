Gluster-S3 Helm Chart
====================

This chart can be used to deploy Gluster-S3, a S3 object storage interface for GlusterFS.

Helm chart settings and deployment
----------------------------------

The following tables lists the configurable parameters of the chart and their default values.

| Parameter                    | Description           | Default                 |
|------------------------------|-----------------------|-------------------------|
| `image`                      | Default image name    | `gluster/gluster-object`|
| `imageTag`                   | Default image tag     | `latest`                |
| `imagePullPolicy`            | Default pull policy   | `IfNotPresent`          |
| `secretName`                 | Secret name           | `s3secret`              |
| `defaultBucket.enabled`      | S3 bucket creation    | `false`                 |
| `defaultBucket.name`         | S3 bucket name        | `mybucket`              |
| `pvc1Request`                | Main PVC request      | `120Gi`                 |
| `pvc2Request`                | Meta PVC request      | `10Gi`                  |
| `hostNetwork`                | How to expose the svc | `false`                 |


This service can be deployed with default settings via Helm using a simple command. You must deploy by setting a S3 <account>, <user> and <password>. It is strongly recommended that these contain more than 6 characters.

```console
$ helm install --name s3-interface account=<account>,user=<user>,password=<password> kubenow/gluster-s3
```

Deployment parameters can be set by using the `--set` flag as follows:

```console
$ helm install --name s3-interface --set account=account,user=user,password=pass,hostNetwork=false,defaultBucket.enabled=true,defaultBucket.name=mybucket kubenow/gluster-s3
```

Clean-up
-------

In order to remove gluster-s3, you can execute the following commands:

```console
$ helm list
$ helm delete <release-name> --purge
```
