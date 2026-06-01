---
slug: "/reference/dotnet/signal-wire.swaig/function-result/replace-in-history-object"
title: "ReplaceInHistory(object?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.SWAIG.FunctionResult.ReplaceInHistory(object?)"
  parent: "SignalWire.SWAIG.FunctionResult"
  module: "SignalWire.SWAIG"
  visibility: "public"
---
# `ReplaceInHistory(object?)`

Replace conversation history. Accepts `true` (default) for the
summary placeholder or a string for custom replacement text.
Matches Python's `replace_in_history(text: Union[bool, str] = True)`.

## Signature

```dotnet
public FunctionResult ReplaceInHistory(object? text = null)
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `text` | `object` | no       | `null`  | —           |

## Returns

`SignalWire.SWAIG.FunctionResult`
