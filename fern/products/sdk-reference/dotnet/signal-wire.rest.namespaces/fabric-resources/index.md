---
slug: "/reference/dotnet/signal-wire.rest.namespaces/fabric-resources"
title: "FabricResources"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.FabricResources"
  parent: "SignalWire.REST.Namespaces"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `FabricResources`

Generic resource operations across all Fabric resource types.

Lives at /api/fabric/resources (the base) and dispatches to per-type
sub-paths. Mirrors Python's
`signalwire.rest.namespaces.fabric.GenericResources`.

## Signature

```dotnet
public class FabricResources
```

## Properties

| Name       | Type                              | Required | Default | Description |
| ---------- | --------------------------------- | -------- | ------- | ----------- |
| `BasePath` | `public string BasePath { get; }` | yes      | —       | —           |

## Methods

- [`AssignDomainApplicationAsync(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.rest.namespaces/fabric-resources/assign-domain-application-async-string-dictionary-string-object)
- [`DeleteAsync(string)`](/reference/dotnet/signal-wire.rest.namespaces/fabric-resources/delete-async-string)
- [`FabricResources(HttpClient, string)`](/reference/dotnet/signal-wire.rest.namespaces/fabric-resources/fabric-resources-http-client-string)
- [`GetAsync(string)`](/reference/dotnet/signal-wire.rest.namespaces/fabric-resources/get-async-string)
- [`ListAddressesAsync(string, Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/fabric-resources/list-addresses-async-string-dictionary-string-string)
- [`ListAsync(Dictionary<string, string>?)`](/reference/dotnet/signal-wire.rest.namespaces/fabric-resources/list-async-dictionary-string-string)
