---
slug: "/reference/dotnet/signal-wire.swml/service-options"
title: "ServiceOptions"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.ServiceOptions"
  parent: "SignalWire.SWML"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `ServiceOptions`

Configuration options for a SWML service.

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class ServiceOptions
```

## Properties

| Name                | Type                                              | Required | Default | Description |
| ------------------- | ------------------------------------------------- | -------- | ------- | ----------- |
| `BasicAuthPassword` | `public string? BasicAuthPassword { get; init; }` | yes      | —       | —           |
| `BasicAuthUser`     | `public string? BasicAuthUser { get; init; }`     | yes      | —       | —           |
| `Host`              | `public string Host { get; init; }`               | yes      | —       | —           |
| `Name`              | `public required string Name { get; init; }`      | yes      | —       | —           |
| `Port`              | `public int? Port { get; init; }`                 | yes      | —       | —           |
| `Route`             | `public string Route { get; init; }`              | yes      | —       | —           |
