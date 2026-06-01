---
slug: "/reference/dotnet/signal-wire.serverless/adapter/handle-lambda-service-dictionary-string-object"
title: "HandleLambda(Service, Dictionary<string, object?>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Serverless.Adapter.HandleLambda(SignalWire.SWML.Service, System.Collections.Generic.Dictionary<string, object?>)"
  parent: "SignalWire.Serverless.Adapter"
  module: "SignalWire.Serverless"
  visibility: "public"
---
# `HandleLambda(Service, Dictionary<string, object?>)`

Handle an AWS Lambda (API Gateway) invocation.

Extracts method, path, headers, and body from the API Gateway event
format, calls agent.HandleRequest(), and returns an API Gateway
compatible response.

**Modifiers:** `static`

## Signature

```dotnet
public static Dictionary<string, object?> HandleLambda(Service agent, Dictionary<string, object?> lambdaEvent)
```

## Parameters

| Name          | Type                        | Required | Default | Description                                                   |
| ------------- | --------------------------- | -------- | ------- | ------------------------------------------------------------- |
| `agent`       | `SignalWire.SWML.Service`   | yes      | —       | An object with a HandleRequest method (AgentBase or Service). |
| `lambdaEvent` | `Dictionary<string,object>` | yes      | —       | The API Gateway event payload as a dictionary.                |

## Returns

`Dictionary<string,object>` — API Gateway response: statusCode, headers, body.
