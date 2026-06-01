---
slug: "/reference/dotnet/signal-wire.contexts/context-builder"
title: "ContextBuilder"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Contexts.ContextBuilder"
  parent: "SignalWire.Contexts"
  module: "SignalWire.Contexts"
  visibility: "public"
---
# `ContextBuilder`

Builder for multi-step, multi-context AI agent workflows.

<p>A ContextBuilder owns one or more <xref href="SignalWire.Contexts.Context" data-throw-if-not-resolved="false"></xref>s; each
context owns an ordered list of <xref href="SignalWire.Contexts.Step" data-throw-if-not-resolved="false"></xref>s. Only one context
and one step is active at a time. Per chat turn, the runtime injects
the current step's instructions as a system message, then asks the LLM
for a response.</p>

<p><b>Native tools auto-injected by the runtime:</b> When a step
(or its enclosing context) declares valid_steps or valid_contexts, the
runtime auto-injects two native tools so the model can navigate the
flow: <code>next_step</code> and <code>change_context</code>. A third native tool,
<code>gather_submit</code>, is injected during gather_info questioning.
These three names are reserved: <xref href="SignalWire.Contexts.ContextBuilder.Validate" data-throw-if-not-resolved="false"></xref> rejects any
agent that defines a SWAIG tool with one of them. See
<xref href="SignalWire.Contexts.ReservedToolNames.Reserved" data-throw-if-not-resolved="false"></xref>.</p>

<p><b>Function whitelisting (<xref href="SignalWire.Contexts.Step.SetFunctions(System.Object)" data-throw-if-not-resolved="false"></xref>):</b>
Each step may declare a functions whitelist. The whitelist is applied
in-memory at the start of each LLM turn. CRITICALLY: if a step does
NOT declare a functions field, it INHERITS the previous step's active
set. See <xref href="SignalWire.Contexts.Step.SetFunctions(System.Object)" data-throw-if-not-resolved="false"></xref> for details and examples.</p>

## Signature

```dotnet
public class ContextBuilder
```

## Methods

- [`AddContext(string)`](/reference/dotnet/signal-wire.contexts/context-builder/add-context-string)
- [`AttachToolNameSupplier(Func<IEnumerable<string>>)`](/reference/dotnet/signal-wire.contexts/context-builder/attach-tool-name-supplier-func-i-enumerable-string) — Attach a supplier that returns registered SWAIG tool names so <xref href="SignalWire.Contexts.ContextBuilder.Validate" data-throw-if-not-resolved="false"></xref> can check them against <xref href="SignalWire.Contexts.ReservedToolNames.Reserved" data-throw-if-not-resolved="false"></xref>. Called internally by <code>AgentBase.DefineContexts()</code>.
- [`CreateSimpleContext(string)`](/reference/dotnet/signal-wire.contexts/context-builder/create-simple-context-string)
- [`GetContext(string)`](/reference/dotnet/signal-wire.contexts/context-builder/get-context-string)
- [`HasContexts()`](/reference/dotnet/signal-wire.contexts/context-builder/has-contexts)
- [`Reset()`](/reference/dotnet/signal-wire.contexts/context-builder/reset) — Remove all contexts, returning the builder to its initial state. Use this in a dynamic config callback when you need to rebuild contexts from scratch for a specific request.
- [`ToDict()`](/reference/dotnet/signal-wire.contexts/context-builder/to-dict)
- [`Validate()`](/reference/dotnet/signal-wire.contexts/context-builder/validate)
