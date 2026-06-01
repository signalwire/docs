---
slug: "/reference/dotnet/signal-wire.swaig/function-result/send-sms-string-string-string-list-string-list-string-string"
title: "SendSms(string, string, string, List<string>?, List<string>?, string?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWAIG.FunctionResult.SendSms(string, string, string, System.Collections.Generic.List<string>?, System.Collections.Generic.List<string>?, string?)"
  parent: "SignalWire.SWAIG.FunctionResult"
  module: "SignalWire.SWAIG"
  visibility: "public"
---
# `SendSms(string, string, string, List<string>?, List<string>?, string?)`

## Signature

```dotnet
public FunctionResult SendSms(string toNumber, string fromNumber, string body, List<string>? media = null, List<string>? tags = null, string? region = null)
```

## Parameters

| Name         | Type           | Required | Default | Description |
| ------------ | -------------- | -------- | ------- | ----------- |
| `toNumber`   | `string`       | yes      | —       | —           |
| `fromNumber` | `string`       | yes      | —       | —           |
| `body`       | `string`       | yes      | —       | —           |
| `media`      | `List<string>` | no       | `null`  | —           |
| `tags`       | `List<string>` | no       | `null`  | —           |
| `region`     | `string`       | no       | `null`  | —           |

## Returns

`SignalWire.SWAIG.FunctionResult`
