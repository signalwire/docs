---
slug: "/reference/dotnet/signal-wire.agent/agent-base/handle-post-prompt-dictionary-string-object-dictionary-string-string"
title: "HandlePostPrompt(Dictionary<string, object?>?, Dictionary<string, string>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentBase.HandlePostPrompt(System.Collections.Generic.Dictionary<string, object?>?, System.Collections.Generic.Dictionary<string, string>)"
  parent: "SignalWire.Agent.AgentBase"
  module: "SignalWire.Agent"
  visibility: "protected"
---
# `HandlePostPrompt(Dictionary<string, object?>?, Dictionary<string, string>)`

Handle the post-prompt callback.

**Modifiers:** `override`

## Signature

```dotnet
protected override (int, Dictionary<string, string>, string) HandlePostPrompt(Dictionary<string, object?>? requestData, Dictionary<string, string> headers)
```

## Parameters

| Name          | Type                        | Required | Default | Description |
| ------------- | --------------------------- | -------- | ------- | ----------- |
| `requestData` | `Dictionary<string,object>` | yes      | —       | —           |
| `headers`     | `Dictionary<string,string>` | yes      | —       | —           |

## Returns

`System.ValueTuple<int,Dictionary<string,string>,string>`
