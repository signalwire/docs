---
slug: "/reference/dotnet/signal-wire.pom/pom-builder/add-subsection-string-string-string-list-string"
title: "AddSubsection(string, string, string, List<string>?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.POM.PomBuilder.AddSubsection(string, string, string, System.Collections.Generic.List<string>?)"
  parent: "SignalWire.POM.PomBuilder"
  module: "SignalWire.POM"
  visibility: "public"
---
# `AddSubsection(string, string, string, List<string>?)`

Add a subsection under an existing section
(auto-vivifies parent if missing). (Python parity:
`PomBuilder.add_subsection`.)

## Signature

```dotnet
public PomBuilder AddSubsection(string parentTitle, string title, string body = "", List<string>? bullets = null)
```

## Parameters

| Name          | Type           | Required | Default | Description |
| ------------- | -------------- | -------- | ------- | ----------- |
| `parentTitle` | `string`       | yes      | —       | —           |
| `title`       | `string`       | yes      | —       | —           |
| `body`        | `string`       | no       | `""`    | —           |
| `bullets`     | `List<string>` | no       | `null`  | —           |

## Returns

`SignalWire.POM.PomBuilder`
