---
slug: "/reference/dotnet/signal-wire.swml/service/handle-request-string-string-dictionary-string-string-string"
title: "HandleRequest(string, string, Dictionary<string, string>, string?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Service.HandleRequest(string, string, System.Collections.Generic.Dictionary<string, string>, string?)"
  parent: "SignalWire.SWML.Service"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `HandleRequest(string, string, Dictionary<string, string>, string?)`

Handle an HTTP request. Returns a tuple of (status, headers, body).

**Modifiers:** `virtual`

## Signature

```dotnet
public virtual (int Status, Dictionary<string, string> Headers, string Body) HandleRequest(string method, string path, Dictionary<string, string> headers, string? body)
```

## Parameters

| Name      | Type                        | Required | Default | Description |
| --------- | --------------------------- | -------- | ------- | ----------- |
| `method`  | `string`                    | yes      | —       | —           |
| `path`    | `string`                    | yes      | —       | —           |
| `headers` | `Dictionary<string,string>` | yes      | —       | —           |
| `body`    | `string`                    | yes      | —       | —           |

## Returns

`System.ValueTuple<int,Dictionary<string,string>,string>`
