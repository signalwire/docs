---
slug: "/reference/dotnet/signal-wire.pom/pom-builder/add-section-string-string-list-string-bool-bool-list-dictionary-string-object"
title: "AddSection(string, string, List<string>?, bool, bool, List<Dictionary<string, object>>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.POM.PomBuilder.AddSection(string, string, System.Collections.Generic.List<string>?, bool, bool, System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>>?)"
  parent: "SignalWire.POM.PomBuilder"
  module: "SignalWire.POM"
  visibility: "public"
---
# `AddSection(string, string, List<string>?, bool, bool, List<Dictionary<string, object>>?)`

Add a new section. (Python parity:
`PomBuilder.add_section`.)

## Signature

```dotnet
public PomBuilder AddSection(string title, string body = "", List<string>? bullets = null, bool numbered = false, bool numberedBullets = false, List<Dictionary<string, object>>? subsections = null)
```

## Parameters

| Name              | Type                              | Required | Default | Description |
| ----------------- | --------------------------------- | -------- | ------- | ----------- |
| `title`           | `string`                          | yes      | —       | —           |
| `body`            | `string`                          | no       | `""`    | —           |
| `bullets`         | `List<string>`                    | no       | `null`  | —           |
| `numbered`        | `bool`                            | no       | `false` | —           |
| `numberedBullets` | `bool`                            | no       | `false` | —           |
| `subsections`     | `List<Dictionary<string,object>>` | no       | `null`  | —           |

## Returns

`SignalWire.POM.PomBuilder`
