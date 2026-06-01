---
slug: "/reference/dotnet/signal-wire.contexts/context/set-isolated-bool"
title: "SetIsolated(bool)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Contexts.Context.SetIsolated(bool)"
  parent: "SignalWire.Contexts.Context"
  module: "SignalWire.Contexts"
  visibility: "public"
---
# `SetIsolated(bool)`

Mark this context as isolated — entering it wipes conversation
history.

<p>When <code class="paramref">isolated</code> = true and the context is
entered via change_context, the runtime wipes the conversation
array. The model starts fresh with only the new context's
system_prompt + step instructions, with no memory of prior
turns.</p>

<p><b>EXCEPTION — reset overrides the wipe:</b> If the context
also has a reset configuration (via <xref href="SignalWire.Contexts.Context.SetConsolidate(System.Boolean)" data-throw-if-not-resolved="false"></xref>
or <xref href="SignalWire.Contexts.Context.SetFullReset(System.Boolean)" data-throw-if-not-resolved="false"></xref>), the wipe is skipped in favor of
the reset behavior. Use reset with consolidate=true to summarize
prior history into a single message instead of dropping it
entirely.</p>

<p>Use cases: switching to a sensitive billing flow that
should not see prior small-talk; handing off to a different agent
persona; resetting after a long off-topic detour.</p>

## Signature

```dotnet
public Context SetIsolated(bool isolated)
```

## Parameters

| Name       | Type   | Required | Default | Description |
| ---------- | ------ | -------- | ------- | ----------- |
| `isolated` | `bool` | yes      | —       | —           |

## Returns

`SignalWire.Contexts.Context`
