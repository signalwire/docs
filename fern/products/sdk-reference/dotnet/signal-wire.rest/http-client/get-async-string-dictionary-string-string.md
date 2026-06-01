---
slug: "/reference/dotnet/signal-wire.rest/http-client/get-async-string-dictionary-string-string"
title: "GetAsync(string, Dictionary<string, string>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.REST.HttpClient.GetAsync(string, System.Collections.Generic.Dictionary<string, string>?)"
  parent: "SignalWire.REST.HttpClient"
  module: "SignalWire.REST"
  visibility: "public"
---
# `GetAsync(string, Dictionary<string, string>?)`

GET with optional query-string parameters.

**Modifiers:** `virtual`

## Signature

```dotnet
public virtual Task<Dictionary<string, object?>> GetAsync(string path, Dictionary<string, string>? queryParams = null)
```

## Parameters

| Name          | Type                        | Required | Default | Description |
| ------------- | --------------------------- | -------- | ------- | ----------- |
| `path`        | `string`                    | yes      | —       | —           |
| `queryParams` | `Dictionary<string,string>` | no       | `null`  | —           |

## Returns

`System.Threading.Tasks.Task<Dictionary<string,object>>`
