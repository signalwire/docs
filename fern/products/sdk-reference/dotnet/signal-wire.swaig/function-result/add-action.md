---
slug: "/reference/dotnet/signal-wire.swaig/function-result/add-action"
title: "AddAction"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWAIG.FunctionResult.AddAction(string, object)"
  parent: "SignalWire.SWAIG.FunctionResult"
  module: "SignalWire.SWAIG"
  visibility: "public"
---
# `AddAction`

Append an action with the given name and arbitrary data
payload. Matches Python's `add_action(name, data)`.

## Signature

**Overload 1**

```dotnet
public FunctionResult AddAction(string name, object data)
```

**Overload 2**

```dotnet
public FunctionResult AddAction(Dictionary<string, object> action)
```

## Parameters (Overload 1)

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `name` | `string` | yes      | —       | —           |
| `data` | `object` | yes      | —       | —           |

## Parameters (Overload 2)

| Name     | Type                        | Required | Default | Description |
| -------- | --------------------------- | -------- | ------- | ----------- |
| `action` | `Dictionary<string,object>` | yes      | —       | —           |

## Returns (Overload 1)

`SignalWire.SWAIG.FunctionResult`

## Returns (Overload 2)

`SignalWire.SWAIG.FunctionResult`
