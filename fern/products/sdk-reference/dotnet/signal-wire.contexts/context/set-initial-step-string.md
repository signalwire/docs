---
slug: "/reference/dotnet/signal-wire.contexts/context/set-initial-step-string"
title: "SetInitialStep(string)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Contexts.Context.SetInitialStep(string)"
  parent: "SignalWire.Contexts.Context"
  module: "SignalWire.Contexts"
  visibility: "public"
---
# `SetInitialStep(string)`

Set which step the context starts on when entered.

<p>By default, a context starts on its first step (index 0). Use
this to skip a preamble step on re-entry via
<code>change_context</code>.</p>

## Signature

```dotnet
public Context SetInitialStep(string stepName)
```

## Parameters

| Name       | Type     | Required | Default | Description                                                |
| ---------- | -------- | -------- | ------- | ---------------------------------------------------------- |
| `stepName` | `string` | yes      | —       | Name of the step to start on (must exist in this context). |

## Returns

`SignalWire.Contexts.Context`
