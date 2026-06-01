---
slug: "/reference/dotnet/signal-wire.swml/service/get-proxy-url-base-dictionary-string-string"
title: "GetProxyUrlBase(Dictionary<string, string>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Service.GetProxyUrlBase(System.Collections.Generic.Dictionary<string, string>?)"
  parent: "SignalWire.SWML.Service"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `GetProxyUrlBase(Dictionary<string, string>?)`

Detect or construct the proxy URL base from request headers.
Priority: SWML\_PROXY\_URL\_BASE env > X-Forwarded-Proto+Host > X-Original-URL > fallback.

## Signature

```dotnet
public string GetProxyUrlBase(Dictionary<string, string>? headers = null)
```

## Parameters

| Name      | Type                        | Required | Default | Description |
| --------- | --------------------------- | -------- | ------- | ----------- |
| `headers` | `Dictionary<string,string>` | no       | `null`  | —           |

## Returns

`string`
