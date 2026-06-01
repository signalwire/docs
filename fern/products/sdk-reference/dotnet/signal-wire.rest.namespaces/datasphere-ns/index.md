---
slug: "/reference/dotnet/signal-wire.rest.namespaces/datasphere-ns"
title: "DatasphereNs"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.DatasphereNs"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `DatasphereNs`

Datasphere namespace — documents with chunks/search.

Mirrors Python `signalwire.rest.namespaces.datasphere.DatasphereNamespace`.
Extends CrudResource — the legacy `client.Datasphere.List` etc went
to /api/datasphere/documents directly; we preserve that surface and
add `Documents` accessor for chunk/search per Python parity.

## Signature

```dotnet
public class DatasphereNs : CrudResource
```

## Inheritance

**Extends:** [SignalWire.REST.CrudResource](/reference/dotnet/signal-wire.rest/crud-resource)

## Properties

| Name        | Type                                            | Required | Default | Description |
| ----------- | ----------------------------------------------- | -------- | ------- | ----------- |
| `Documents` | `public DatasphereDocuments Documents { get; }` | yes      | —       | —           |

## Methods

- [`DatasphereNs(HttpClient)`](/reference/dotnet/signal-wire.rest.namespaces/datasphere-ns/datasphere-ns-http-client)
