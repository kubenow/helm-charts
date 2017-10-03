# Cheese Helm Chart
This charts implements the simple cheese deployment described by Traefik documentation: http://docs.traefik.io/user-guide/kubernetes/. This provides a nice starting point if you are new to Kubernetes and Helm, as well as being nice for live demos.

## Chart Details
This chart will deploy 3 cheese web pages with replica 2 (6 pods in total). The pods replicas will be load balanced  by the edge nodes if you are using KubeNow.

## Installing the Chart
You can install the Chart via Helm CLI:

```console
$ helm install --name cheese --set domain=your.domain.name kubenow/cheese
```

## Installing the Chart
You can uninstall the Chart via Helm CLI:

```console
$ helm delete cheese
```
