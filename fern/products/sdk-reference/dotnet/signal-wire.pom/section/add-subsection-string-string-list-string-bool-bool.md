---
slug: "/reference/dotnet/signal-wire.pom/section/add-subsection-string-string-list-string-bool-bool"
title: "AddSubsection(string?, string, List<string>?, bool?, bool)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.POM.Section.AddSubsection(string?, string, System.Collections.Generic.List<string>?, bool?, bool)"
  parent: "SignalWire.POM.Section"
  module: "SignalWire.POM"
  visibility: "public"
---
# `AddSubsection(string?, string, List<string>?, bool?, bool)`

Add a subsection under this section, returning the new
Section. (Python parity: `Section.add_subsection`.)

## Signature

```dotnet
public Section AddSubsection(string? title = null, string body = "", List<string>? bullets = null, bool? numbered = null, bool numberedBullets = false)
```

## Parameters

| Name              | Type                    | Required | Default | Description |
| ----------------- | ----------------------- | -------- | ------- | ----------- |
| `title`           | `string`                | no       | `null`  | —           |
| `body`            | `string`                | no       | `""`    | —           |
| `bullets`         | `List<string>`          | no       | `null`  | —           |
| `numbered`        | `System.Nullable<bool>` | no       | `null`  | —           |
| `numberedBullets` | `bool`                  | no       | `false` | —           |

## Returns

`SignalWire.POM.Section`
