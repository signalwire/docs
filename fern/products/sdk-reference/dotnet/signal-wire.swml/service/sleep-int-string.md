---
slug: "/reference/dotnet/signal-wire.swml/service/sleep-int-string"
title: "Sleep(int, string)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.Service.Sleep(int, string)"
  parent: "SignalWire.SWML.Service"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `Sleep(int, string)`

Add a sleep verb with a duration in milliseconds to the specified section.

## Signature

```dotnet
public Service Sleep(int milliseconds, string section = "main")
```

## Parameters

| Name           | Type     | Required | Default  | Description |
| -------------- | -------- | -------- | -------- | ----------- |
| `milliseconds` | `int`    | yes      | —        | —           |
| `section`      | `string` | no       | `"main"` | —           |

## Returns

`SignalWire.SWML.Service`
