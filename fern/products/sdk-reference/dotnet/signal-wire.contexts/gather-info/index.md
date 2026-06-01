---
slug: "/reference/dotnet/signal-wire.contexts/gather-info"
title: "GatherInfo"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Contexts.GatherInfo"
  parent: "SignalWire.Contexts"
  module: "SignalWire.Contexts"
  visibility: "public"
---
# `GatherInfo`

## Signature

```dotnet
public class GatherInfo
```

## Properties

| Name               | Type                                             | Required | Default | Description |
| ------------------ | ------------------------------------------------ | -------- | ------- | ----------- |
| `CompletionAction` | `public string? CompletionAction { get; }`       | yes      | —       | —           |
| `Questions`        | `public List<GatherQuestion> Questions { get; }` | yes      | —       | —           |

## Methods

- [`AddQuestion(Dictionary<string, object>)`](/reference/dotnet/signal-wire.contexts/gather-info/add-question-dictionary-string-object)
- [`GatherInfo(string?, string?, string?)`](/reference/dotnet/signal-wire.contexts/gather-info/gather-info-string-string-string)
- [`ToDict()`](/reference/dotnet/signal-wire.contexts/gather-info/to-dict)
