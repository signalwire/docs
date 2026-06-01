---
slug: "/reference/dotnet/signal-wire.swml/service/define-tool-string-string-dictionary-string-object-func-dictionary-string-object-dictionary-string-object-function-result-bool"
title: "DefineTool(string, string, Dictionary<string, object>, Func<Dictionary<string, object>, Dictionary<string, object?>, FunctionResult>, bool)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Service.DefineTool(string, string, System.Collections.Generic.Dictionary<string, object>, System.Func<System.Collections.Generic.Dictionary<string, object>, System.Collections.Generic.Dictionary<string, object?>, SignalWire.SWAIG.FunctionResult>, bool)"
  parent: "SignalWire.SWML.Service"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `DefineTool(string, string, Dictionary<string, object>, Func<Dictionary<string, object>, Dictionary<string, object?>, FunctionResult>, bool)`

Define a SWAIG function the AI can call. Tool descriptions and
parameter descriptions are LLM-facing prompt engineering — see
PORTING\_GUIDE for guidance on writing them.

**Modifiers:** `virtual`

## Signature

```dotnet
public virtual Service DefineTool(string name, string description, Dictionary<string, object> parameters, Func<Dictionary<string, object>, Dictionary<string, object?>, FunctionResult> handler, bool secure = false)
```

## Parameters

| Name          | Type                                                                                               | Required | Default | Description |
| ------------- | -------------------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `name`        | `string`                                                                                           | yes      | —       | —           |
| `description` | `string`                                                                                           | yes      | —       | —           |
| `parameters`  | `Dictionary<string,object>`                                                                        | yes      | —       | —           |
| `handler`     | `System.Func<Dictionary<string,object>,Dictionary<string,object>,SignalWire.SWAIG.FunctionResult>` | yes      | —       | —           |
| `secure`      | `bool`                                                                                             | no       | `false` | —           |

## Returns

`SignalWire.SWML.Service`
