---
slug: "/reference/dotnet/signal-wire.rest.namespaces/subscribers-helper/list-sip-endpoints-async-string-dictionary-string-string"
title: "ListSipEndpointsAsync(string, Dictionary<string, string>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.REST.Namespaces.SubscribersHelper.ListSipEndpointsAsync(string, System.Collections.Generic.Dictionary<string, string>?)"
  parent: "SignalWire.REST.Namespaces.SubscribersHelper"
  module: "SignalWire.REST.Namespaces"
  visibility: "public"
---
# `ListSipEndpointsAsync(string, Dictionary<string, string>?)`

## Signature

```dotnet
public Task<Dictionary<string, object?>> ListSipEndpointsAsync(string subscriberId, Dictionary<string, string>? queryParams = null)
```

## Parameters

| Name           | Type                        | Required | Default | Description |
| -------------- | --------------------------- | -------- | ------- | ----------- |
| `subscriberId` | `string`                    | yes      | —       | —           |
| `queryParams`  | `Dictionary<string,string>` | no       | `null`  | —           |

## Returns

`System.Threading.Tasks.Task<Dictionary<string,object>>`
