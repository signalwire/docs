---
slug: "/reference/dotnet/signal-wire.rest/http-client/patch-async-string-dictionary-string-object"
title: "PatchAsync(string, Dictionary<string, object?>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.REST.HttpClient.PatchAsync(string, System.Collections.Generic.Dictionary<string, object?>?)"
  parent: "SignalWire.REST.HttpClient"
  module: "SignalWire.REST"
  visibility: "public"
---
# `PatchAsync(string, Dictionary<string, object?>?)`

PATCH with JSON body.

**Modifiers:** `virtual`

## Signature

```dotnet
public virtual Task<Dictionary<string, object?>> PatchAsync(string path, Dictionary<string, object?>? data = null)
```

## Parameters

| Name   | Type                        | Required | Default | Description |
| ------ | --------------------------- | -------- | ------- | ----------- |
| `path` | `string`                    | yes      | —       | —           |
| `data` | `Dictionary<string,object>` | no       | `null`  | —           |

## Returns

`System.Threading.Tasks.Task<Dictionary<string,object>>`
