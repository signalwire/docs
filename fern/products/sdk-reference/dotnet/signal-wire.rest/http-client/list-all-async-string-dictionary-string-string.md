---
slug: "/reference/dotnet/signal-wire.rest/http-client/list-all-async-string-dictionary-string-string"
title: "ListAllAsync(string, Dictionary<string, string>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.REST.HttpClient.ListAllAsync(string, System.Collections.Generic.Dictionary<string, string>?)"
  parent: "SignalWire.REST.HttpClient"
  module: "SignalWire.REST"
  visibility: "public"
---
# `ListAllAsync(string, Dictionary<string, string>?)`

Return pages by following "next" links automatically.
Expects { "data": \[...], "links": { "next": "..." } }.

## Signature

```dotnet
public IAsyncEnumerable<List<Dictionary<string, object?>>> ListAllAsync(string path, Dictionary<string, string>? queryParams = null)
```

## Parameters

| Name          | Type                        | Required | Default | Description |
| ------------- | --------------------------- | -------- | ------- | ----------- |
| `path`        | `string`                    | yes      | —       | —           |
| `queryParams` | `Dictionary<string,string>` | no       | `null`  | —           |

## Returns

`IAsyncEnumerable<List<Dictionary<string,object>>>`
