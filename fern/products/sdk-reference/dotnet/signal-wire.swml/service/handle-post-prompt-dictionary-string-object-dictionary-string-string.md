---
slug: "/reference/dotnet/signal-wire.swml/service/handle-post-prompt-dictionary-string-object-dictionary-string-string"
title: "HandlePostPrompt(Dictionary<string, object?>?, Dictionary<string, string>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Service.HandlePostPrompt(System.Collections.Generic.Dictionary<string, object?>?, System.Collections.Generic.Dictionary<string, string>)"
  parent: "SignalWire.SWML.Service"
  module: "SignalWire.SWML"
  visibility: "protected"
---
# `HandlePostPrompt(Dictionary<string, object?>?, Dictionary<string, string>)`

Handle post-prompt callback. Override in AgentBase.

**Modifiers:** `virtual`

## Signature

```dotnet
protected virtual (int, Dictionary<string, string>, string) HandlePostPrompt(Dictionary<string, object?>? requestData, Dictionary<string, string> headers)
```

## Parameters

| Name          | Type                        | Required | Default | Description |
| ------------- | --------------------------- | -------- | ------- | ----------- |
| `requestData` | `Dictionary<string,object>` | yes      | —       | —           |
| `headers`     | `Dictionary<string,string>` | yes      | —       | —           |

## Returns

`System.ValueTuple<int,Dictionary<string,string>,string>`
