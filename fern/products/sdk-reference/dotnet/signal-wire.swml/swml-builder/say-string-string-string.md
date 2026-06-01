---
slug: "/reference/dotnet/signal-wire.swml/swml-builder/say-string-string-string"
title: "Say(string, string?, string?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.SWMLBuilder.Say(string, string?, string?)"
  parent: "SignalWire.SWML.SWMLBuilder"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `Say(string, string?, string?)`

Add a `say` verb (synthesized speech).
(Python parity: `SWMLBuilder.say(text, voice, language)`.)

## Signature

```dotnet
public SWMLBuilder Say(string text, string? voice = null, string? language = null)
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `text`     | `string` | yes      | —       | —           |
| `voice`    | `string` | no       | `null`  | —           |
| `language` | `string` | no       | `null`  | —           |

## Returns

`SignalWire.SWML.SWMLBuilder`
