---
slug: "/reference/dotnet/signal-wire.data-map/data-map/webhook-string-string-dictionary-string-string-string-bool-list-string"
title: "Webhook(string, string, Dictionary<string, string>?, string, bool, List<string>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.DataMap.DataMap.Webhook(string, string, System.Collections.Generic.Dictionary<string, string>?, string, bool, System.Collections.Generic.List<string>?)"
  parent: "SignalWire.DataMap.DataMap"
  module: "SignalWire.DataMap"
  visibility: "public"
---
# `Webhook(string, string, Dictionary<string, string>?, string, bool, List<string>?)`

## Signature

```dotnet
public DataMap Webhook(string method, string url, Dictionary<string, string>? headers = null, string formParam = "", bool inputArgsAsParams = false, List<string>? requireArgs = null)
```

## Parameters

| Name                | Type                        | Required | Default | Description |
| ------------------- | --------------------------- | -------- | ------- | ----------- |
| `method`            | `string`                    | yes      | —       | —           |
| `url`               | `string`                    | yes      | —       | —           |
| `headers`           | `Dictionary<string,string>` | no       | `null`  | —           |
| `formParam`         | `string`                    | no       | `""`    | —           |
| `inputArgsAsParams` | `bool`                      | no       | `false` | —           |
| `requireArgs`       | `List<string>`              | no       | `null`  | —           |

## Returns

`SignalWire.DataMap.DataMap`
