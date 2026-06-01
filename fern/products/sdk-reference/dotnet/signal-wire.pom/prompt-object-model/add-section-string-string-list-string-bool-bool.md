---
slug: "/reference/dotnet/signal-wire.pom/prompt-object-model/add-section-string-string-list-string-bool-bool"
title: "AddSection(string?, string, List<string>?, bool?, bool)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.POM.PromptObjectModel.AddSection(string?, string, System.Collections.Generic.List<string>?, bool?, bool)"
  parent: "SignalWire.POM.PromptObjectModel"
  module: "SignalWire.POM"
  visibility: "public"
---
# `AddSection(string?, string, List<string>?, bool?, bool)`

Add a top-level section to the model, returning the new
Section. Only the first added section may have a null title.
(Python parity: `PromptObjectModel.add_section`.)

## Signature

```dotnet
public Section AddSection(string? title = null, string body = "", List<string>? bullets = null, bool? numbered = null, bool numberedBullets = false)
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
