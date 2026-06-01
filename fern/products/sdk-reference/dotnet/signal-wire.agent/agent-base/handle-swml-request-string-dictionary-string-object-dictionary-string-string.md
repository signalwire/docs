---
slug: "/reference/dotnet/signal-wire.agent/agent-base/handle-swml-request-string-dictionary-string-object-dictionary-string-string"
title: "HandleSwmlRequest(string, Dictionary<string, object?>?, Dictionary<string, string>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentBase.HandleSwmlRequest(string, System.Collections.Generic.Dictionary<string, object?>?, System.Collections.Generic.Dictionary<string, string>)"
  parent: "SignalWire.Agent.AgentBase"
  module: "SignalWire.Agent"
  visibility: "protected"
---
# `HandleSwmlRequest(string, Dictionary<string, object?>?, Dictionary<string, string>)`

Handle the SWML document request. If a dynamic-config callback is registered,
clone the agent, pass the clone to the callback, and render from the clone.

**Modifiers:** `override`

## Signature

```dotnet
protected override (int, Dictionary<string, string>, string) HandleSwmlRequest(string method, Dictionary<string, object?>? requestData, Dictionary<string, string> headers)
```

## Parameters

| Name          | Type                        | Required | Default | Description |
| ------------- | --------------------------- | -------- | ------- | ----------- |
| `method`      | `string`                    | yes      | —       | —           |
| `requestData` | `Dictionary<string,object>` | yes      | —       | —           |
| `headers`     | `Dictionary<string,string>` | yes      | —       | —           |

## Returns

`System.ValueTuple<int,Dictionary<string,string>,string>`
