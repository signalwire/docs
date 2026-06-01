---
slug: "/reference/dotnet/signal-wire.swml/service/handle-swml-request-string-dictionary-string-object-dictionary-string-string"
title: "HandleSwmlRequest(string, Dictionary<string, object?>?, Dictionary<string, string>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Service.HandleSwmlRequest(string, System.Collections.Generic.Dictionary<string, object?>?, System.Collections.Generic.Dictionary<string, string>)"
  parent: "SignalWire.SWML.Service"
  module: "SignalWire.SWML"
  visibility: "protected"
---
# `HandleSwmlRequest(string, Dictionary<string, object?>?, Dictionary<string, string>)`

Handle SWML document request.

**Modifiers:** `virtual`

## Signature

```dotnet
protected virtual (int, Dictionary<string, string>, string) HandleSwmlRequest(string method, Dictionary<string, object?>? requestData, Dictionary<string, string> headers)
```

## Parameters

| Name          | Type                        | Required | Default | Description |
| ------------- | --------------------------- | -------- | ------- | ----------- |
| `method`      | `string`                    | yes      | —       | —           |
| `requestData` | `Dictionary<string,object>` | yes      | —       | —           |
| `headers`     | `Dictionary<string,string>` | yes      | —       | —           |

## Returns

`System.ValueTuple<int,Dictionary<string,string>,string>`
