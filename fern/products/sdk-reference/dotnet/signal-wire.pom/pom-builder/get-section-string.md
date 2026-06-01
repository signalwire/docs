---
slug: "/reference/dotnet/signal-wire.pom/pom-builder/get-section-string"
title: "GetSection(string)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.POM.PomBuilder.GetSection(string)"
  parent: "SignalWire.POM.PomBuilder"
  module: "SignalWire.POM"
  visibility: "public"
---
# `GetSection(string)`

Get a section by title, or null if absent.
(Python parity: `PomBuilder.get_section`.)

## Signature

```dotnet
public Section? GetSection(string title)
```

## Parameters

| Name    | Type     | Required | Default | Description |
| ------- | -------- | -------- | ------- | ----------- |
| `title` | `string` | yes      | —       | —           |

## Returns

`SignalWire.POM.Section`
