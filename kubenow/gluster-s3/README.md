gluster-s3 Helm Chart
====================

This chart can be used to deploy gluster-s3, a S3 object storage interface for GlusterFS.

Helm chart settings and deployment
----------------------------------

The following tables lists the configurable parameters of the chart and their default values.

| Parameter                    | Description           | Default           |
|------------------------------|-----------------------|-------------------|
| `releaseName`                | Default chart name    | `s3-interface`    |
| `secretName`                 | Secret name           | `s3secret`        |
| `account`                    | S3 account            | `account`         |
| `user`                       | S3 user               | `user`            |
| `password`                   | S3 password           | `8VBdiwxL2s`      |
| `bucketName`                 | S3 bucket name        | `mybucket`        |
| `pvc1Name`                   | PVC1 name             | `main-gs3-pvc`    |
| `pvc1Request`                | Main PVC request      | `120Gi`           |
| `pvc2Name`                   | PVC2 name             | `meta-gs3-pvc`    |
| `pvc2Request`                | Meta PVC request      | `10Gi`            |


This service can be deployed with default settings via Helm using:

```console
$ helm install --name s3-interface kubenow/gluster-s3
```

Deployment parameters can be set by using the `--set` flag as follows:

```console
$ helm install --name s3-interface --set bucketName=mybucket,account=account,user=user,password=pass kubenow/gluster-s3
```

Clean-up
-------

In order to remove gluster-s3, you can execute the following commands:

```console
$ helm list
$ helm delete <release-name> --purge
```
