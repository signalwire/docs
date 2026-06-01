---
slug: "/reference/dotnet/signal-wire.relay/client/execute-async-string-dictionary-string-object"
title: "ExecuteAsync(string, Dictionary<string, object?>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Client.ExecuteAsync(string, System.Collections.Generic.Dictionary<string, object?>?)"
  parent: "SignalWire.Relay.Client"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `ExecuteAsync(string, Dictionary<string, object?>?)`

Send a JSON-RPC request and await the matching response.
Returns the "result" portion of the response.

## Signature

```dotnet
public Task<Dictionary<string, object?>> ExecuteAsync(string method, Dictionary<string, object?>? params_ = null)
```

## Parameters

| Name      | Type                        | Required | Default | Description |
| --------- | --------------------------- | -------- | ------- | ----------- |
| `method`  | `string`                    | yes      | —       | —           |
| `params_` | `Dictionary<string,object>` | no       | `null`  | —           |

## Returns

`System.Threading.Tasks.Task<Dictionary<string,object>>`
