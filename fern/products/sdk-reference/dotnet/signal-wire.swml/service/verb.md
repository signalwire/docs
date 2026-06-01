---
slug: "/reference/dotnet/signal-wire.swml/service/verb"
title: "Verb"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Service.Verb(string, string, object?)"
  parent: "SignalWire.SWML.Service"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `Verb`

Add a verb to the specified section. Validates the verb name against the schema.
Returns this service for fluent chaining.

## Signature

**Overload 1**

```dotnet
public Service Verb(string verbName, string section, object? config)
```

**Overload 2**

```dotnet
public Service Verb(string verbName, object? config)
```

## Parameters (Overload 1)

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `verbName` | `string` | yes      | —       | —           |
| `section`  | `string` | yes      | —       | —           |
| `config`   | `object` | yes      | —       | —           |

## Parameters (Overload 2)

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `verbName` | `string` | yes      | —       | —           |
| `config`   | `object` | yes      | —       | —           |

## Returns (Overload 1)

`SignalWire.SWML.Service`

## Returns (Overload 2)

`SignalWire.SWML.Service`
