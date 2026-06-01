---
slug: "/reference/dotnet/signal-wire.swaig/function-result/pay-string-string-string-int-int"
title: "Pay(string, string, string, int, int)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWAIG.FunctionResult.Pay(string, string, string, int, int)"
  parent: "SignalWire.SWAIG.FunctionResult"
  module: "SignalWire.SWAIG"
  visibility: "public"
---
# `Pay(string, string, string, int, int)`

## Signature

```dotnet
public FunctionResult Pay(string connectorUrl, string inputMethod = "dtmf", string actionUrl = "", int timeout = 600, int maxAttempts = 3)
```

## Parameters

| Name           | Type     | Required | Default  | Description |
| -------------- | -------- | -------- | -------- | ----------- |
| `connectorUrl` | `string` | yes      | —        | —           |
| `inputMethod`  | `string` | no       | `"dtmf"` | —           |
| `actionUrl`    | `string` | no       | `""`     | —           |
| `timeout`      | `int`    | no       | `600`    | —           |
| `maxAttempts`  | `int`    | no       | `3`      | —           |

## Returns

`SignalWire.SWAIG.FunctionResult`
