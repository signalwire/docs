---
slug: "/reference/dotnet/signal-wire.swml/service/on-function-call-string-dictionary-string-object-dictionary-string-object"
title: "OnFunctionCall(string, Dictionary<string, object>, Dictionary<string, object?>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Service.OnFunctionCall(string, System.Collections.Generic.Dictionary<string, object>, System.Collections.Generic.Dictionary<string, object?>)"
  parent: "SignalWire.SWML.Service"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `OnFunctionCall(string, Dictionary<string, object>, Dictionary<string, object?>)`

Dispatch a function call to the registered handler.

**Modifiers:** `virtual`

## Signature

```dotnet
public virtual FunctionResult? OnFunctionCall(string name, Dictionary<string, object> args, Dictionary<string, object?> rawData)
```

## Parameters

| Name      | Type                        | Required | Default | Description |
| --------- | --------------------------- | -------- | ------- | ----------- |
| `name`    | `string`                    | yes      | —       | —           |
| `args`    | `Dictionary<string,object>` | yes      | —       | —           |
| `rawData` | `Dictionary<string,object>` | yes      | —       | —           |

## Returns

`SignalWire.SWAIG.FunctionResult`
