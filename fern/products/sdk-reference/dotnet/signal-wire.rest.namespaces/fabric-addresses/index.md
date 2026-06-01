---
slug: "/reference/dotnet/signal-wire.rest.namespaces/fabric-addresses"
title: "FabricAddresses"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.FabricAddresses"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `FabricAddresses`

Read-only top-level Fabric addresses resource (lives at
/api/fabric/addresses, NOT under /api/fabric/resources).

Mirrors Python `signalwire.rest.namespaces.fabric.FabricAddresses`.

## Signature

```dotnet
public class FabricAddresses
```

## Properties

| Name       | Type                              | Required | Default | Description |
| ---------- | --------------------------------- | -------- | ------- | ----------- |
| `BasePath` | `public string BasePath { get; }` | yes      | —       | —           |

## Methods

- [`FabricAddresses(HttpClient, string)`](/reference/dotnet/signal-wire.rest.namespaces/fabric-addresses/fabric-addresses-http-client-string)
- [`GetAsync(string)`](/reference/dotnet/signal-wire.rest.namespaces/fabric-addresses/get-async-string)
- [`ListAsync(Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/fabric-addresses/list-async-dictionary-string-string)
