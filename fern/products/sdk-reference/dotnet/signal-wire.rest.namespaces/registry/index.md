---
slug: "/reference/dotnet/signal-wire.rest.namespaces/registry"
title: "Registry"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.Registry"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `Registry`

10DLC Campaign Registry namespace — brands, campaigns, orders, numbers.

Mirrors Python `signalwire.rest.namespaces.registry.RegistryNamespace`
(everything under /api/relay/rest/registry/beta).

<p>Inherits from <xref href="SignalWire.REST.CrudResource" data-throw-if-not-resolved="false"></xref> so the legacy
``client.Registry.BasePath`` accessor still resolves; the new
Brands/Campaigns/Orders/Numbers accessors target the per-resource
endpoints under /api/relay/rest/registry/beta.</p>

## Signature

```dotnet
public class Registry : CrudResource
```

## Inheritance

**Extends:** [SignalWire.REST.CrudResource](/reference/dotnet/signal-wire.rest/crud-resource)

## Properties

| Name        | Type                                          | Required | Default | Description |
| ----------- | --------------------------------------------- | -------- | ------- | ----------- |
| `Brands`    | `public RegistryBrands Brands { get; }`       | yes      | —       | —           |
| `Campaigns` | `public RegistryCampaigns Campaigns { get; }` | yes      | —       | —           |
| `Numbers`   | `public RegistryNumbers Numbers { get; }`     | yes      | —       | —           |
| `Orders`    | `public RegistryOrders Orders { get; }`       | yes      | —       | —           |

## Methods

- [`Registry(HttpClient)`](/reference/dotnet/signal-wire.rest.namespaces/registry/registry-http-client)
