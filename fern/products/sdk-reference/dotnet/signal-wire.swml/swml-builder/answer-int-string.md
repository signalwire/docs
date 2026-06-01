---
slug: "/reference/dotnet/signal-wire.swml/swml-builder/answer-int-string"
title: "Answer(int?, string?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWML.SWMLBuilder.Answer(int?, string?)"
  parent: "SignalWire.SWML.SWMLBuilder"
  module: "SignalWire.SWML"
  visibility: "public"
---
# `Answer(int?, string?)`

Add an `answer` verb. (Python parity:
`SWMLBuilder.answer(max_duration, codecs)`.)

## Signature

```dotnet
public SWMLBuilder Answer(int? maxDuration = null, string? codecs = null)
```

## Parameters

| Name          | Type                   | Required | Default | Description |
| ------------- | ---------------------- | -------- | ------- | ----------- |
| `maxDuration` | `System.Nullable<int>` | no       | `null`  | —           |
| `codecs`      | `string`               | no       | `null`  | —           |

## Returns

`SignalWire.SWML.SWMLBuilder`
