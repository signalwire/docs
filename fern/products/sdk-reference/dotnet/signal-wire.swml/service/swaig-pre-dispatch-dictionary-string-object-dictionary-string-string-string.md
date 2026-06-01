---
slug: "/reference/dotnet/signal-wire.swml/service/swaig-pre-dispatch-dictionary-string-object-dictionary-string-string-string"
title: "SwaigPreDispatch(Dictionary<string, object?>, Dictionary<string, string>, string)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Service.SwaigPreDispatch(System.Collections.Generic.Dictionary<string, object?>, System.Collections.Generic.Dictionary<string, string>, string)"
  parent: "SignalWire.SWML.Service"
  module: "SignalWire.SWML"
  visibility: "protected"
---
# `SwaigPreDispatch(Dictionary<string, object?>, Dictionary<string, string>, string)`

Extension point: invoked between argument parsing and function
dispatch. Returns (target, shortCircuit). When shortCircuit is
non-null, it's returned directly without calling OnFunctionCall.
AgentBase may override to add session-token validation or ephemeral
dynamic-config copies.

**Modifiers:** `virtual`

## Signature

```dotnet
protected virtual (Service Target, Dictionary<string, object>? ShortCircuit) SwaigPreDispatch(Dictionary<string, object?> requestData, Dictionary<string, string> headers, string functionName)
```

## Parameters

| Name           | Type                        | Required | Default | Description |
| -------------- | --------------------------- | -------- | ------- | ----------- |
| `requestData`  | `Dictionary<string,object>` | yes      | —       | —           |
| `headers`      | `Dictionary<string,string>` | yes      | —       | —           |
| `functionName` | `string`                    | yes      | —       | —           |

## Returns

`System.ValueTuple<SignalWire.SWML.Service,Dictionary<string,object>>`
