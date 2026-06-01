---
slug: "/reference/dotnet/signal-wire.serverless/adapter/handle-azure-service-dictionary-string-object"
title: "HandleAzure(Service, Dictionary<string, object?>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Serverless.Adapter.HandleAzure(SignalWire.SWML.Service, System.Collections.Generic.Dictionary<string, object?>)"
  parent: "SignalWire.Serverless.Adapter"
  module: "SignalWire.Serverless"
  visibility: "public"
---
# `HandleAzure(Service, Dictionary<string, object?>)`

Handle an Azure Functions invocation.

Extracts method, path, headers, and body from the Azure request
dictionary, calls agent.HandleRequest(), and returns an Azure-compatible
response dictionary.

**Modifiers:** `static`

## Signature

```dotnet
public static Dictionary<string, object?> HandleAzure(Service agent, Dictionary<string, object?> request)
```

## Parameters

| Name      | Type                        | Required | Default | Description |
| --------- | --------------------------- | -------- | ------- | ----------- |
| `agent`   | `SignalWire.SWML.Service`   | yes      | —       | —           |
| `request` | `Dictionary<string,object>` | yes      | —       | —           |

## Returns

`Dictionary<string,object>`
