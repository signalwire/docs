---
slug: "/reference/dotnet/signal-wire.swml/swml-builder/play-string-list-string-double-string-string-string"
title: "Play(string?, List<string>?, double?, string?, string?, string?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.SWMLBuilder.Play(string?, System.Collections.Generic.List<string>?, double?, string?, string?, string?)"
  parent: "SignalWire.SWML.SWMLBuilder"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `Play(string?, List<string>?, double?, string?, string?, string?)`

Add a `play` verb. (Python parity:
`SWMLBuilder.play(url, urls, volume, say_text, say_voice, say_language)`.)

## Signature

```dotnet
public SWMLBuilder Play(string? url = null, List<string>? urls = null, double? volume = null, string? sayText = null, string? sayVoice = null, string? sayLanguage = null)
```

## Parameters

| Name          | Type                      | Required | Default | Description |
| ------------- | ------------------------- | -------- | ------- | ----------- |
| `url`         | `string`                  | no       | `null`  | —           |
| `urls`        | `List<string>`            | no       | `null`  | —           |
| `volume`      | `System.Nullable<double>` | no       | `null`  | —           |
| `sayText`     | `string`                  | no       | `null`  | —           |
| `sayVoice`    | `string`                  | no       | `null`  | —           |
| `sayLanguage` | `string`                  | no       | `null`  | —           |

## Returns

`SignalWire.SWML.SWMLBuilder`
