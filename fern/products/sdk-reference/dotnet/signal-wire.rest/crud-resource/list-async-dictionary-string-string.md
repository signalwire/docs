---
slug: "/reference/dotnet/signal-wire.rest/crud-resource/list-async-dictionary-string-string"
title: "ListAsync(Dictionary<string, string>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.REST.CrudResource.ListAsync(System.Collections.Generic.Dictionary<string, string>?)"
  parent: "SignalWire.REST.CrudResource"
  module: "SignalWire.REST"
  visibility: "public"
---
# `ListAsync(Dictionary<string, string>?)`

List resources (GET basePath).

**Modifiers:** `virtual`

## Signature

```dotnet
public virtual Task<Dictionary<string, object?>> ListAsync(Dictionary<string, string>? queryParams = null)
```

## Parameters

| Name          | Type                        | Required | Default | Description |
| ------------- | --------------------------- | -------- | ------- | ----------- |
| `queryParams` | `Dictionary<string,string>` | no       | `null`  | —           |

## Returns

`System.Threading.Tasks.Task<Dictionary<string,object>>`
