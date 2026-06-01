---
slug: "/reference/dotnet/signal-wire.contexts/step/set-end-bool"
title: "SetEnd(bool)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Contexts.Step.SetEnd(bool)"
  parent: "SignalWire.Contexts.Step"
  module: "SignalWire.Contexts"
  visibility: "public"
---
# `SetEnd(bool)`

Mark this step as terminal for the step flow.

<p><b>IMPORTANT:</b> <code class="paramref">end</code> = true does NOT end
the conversation or hang up the call. It exits step mode entirely
after this step executes — clearing the steps list, current step
index, valid_steps, and valid_contexts. The agent keeps running,
but operates only under the base system prompt and the
context-level prompt; no more step instructions are injected and
no more <code>next_step</code> tool is offered.</p>

<p>To actually end the call, call a hangup tool or define a
hangup hook.</p>

## Signature

```dotnet
public Step SetEnd(bool end)
```

## Parameters

| Name  | Type   | Required | Default | Description |
| ----- | ------ | -------- | ------- | ----------- |
| `end` | `bool` | yes      | —       | —           |

## Returns

`SignalWire.Contexts.Step`
