---
slug: "/reference/dotnet/signal-wire.swml/service/extract-sip-username-dictionary-string-object"
title: "ExtractSipUsername(Dictionary<string, object?>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Service.ExtractSipUsername(System.Collections.Generic.Dictionary<string, object?>?)"
  parent: "SignalWire.SWML.Service"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `ExtractSipUsername(Dictionary<string, object?>?)`

Extract SIP username from a request body.
Validates format: only \[a-zA-Z0-9.\_-], max 64 chars.

**Modifiers:** `static`

## Signature

```dotnet
public static string? ExtractSipUsername(Dictionary<string, object?>? body)
```

## Parameters

| Name   | Type                        | Required | Default | Description |
| ------ | --------------------------- | -------- | ------- | ----------- |
| `body` | `Dictionary<string,object>` | yes      | —       | —           |

## Returns

`string`
