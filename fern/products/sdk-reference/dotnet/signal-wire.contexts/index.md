---
slug: "/reference/dotnet/signal-wire.contexts"
title: "SignalWire.Contexts"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "module"
  language: "dotnet"
  qualified_name: "SignalWire.Contexts"
---
# `SignalWire.Contexts`

## Classes

- [`Context`](/reference/dotnet/signal-wire.contexts/context)
- [`ContextBuilder`](/reference/dotnet/signal-wire.contexts/context-builder) — Builder for multi-step, multi-context AI agent workflows. <p>A ContextBuilder owns one or more <xref href="SignalWire.Contexts.Context" data-throw-if-not-resolved="false"></xref>s; each context owns an ordered list of <xref href="SignalWire.Contexts.Step" data-throw-if-not-resolved="false"></xref>s. Only one context and one step is active at a time. Per chat turn, the runtime injects the current step's instructions as a system message, then asks the LLM for a response.</p> <p><b>Native tools auto-injected by the runtime:</b> When a step (or its enclosing context) declares valid\_steps or valid\_contexts, the runtime auto-injects two native tools so the model can navigate the flow: <code>next\_step</code> and <code>change\_context</code>. A third native tool, <code>gather\_submit</code>, is injected during gather\_info questioning. These three names are reserved: <xref href="SignalWire.Contexts.ContextBuilder.Validate" data-throw-if-not-resolved="false"></xref> rejects any agent that defines a SWAIG tool with one of them. See <xref href="SignalWire.Contexts.ReservedToolNames.Reserved" data-throw-if-not-resolved="false"></xref>.</p> <p><b>Function whitelisting (<xref href="SignalWire.Contexts.Step.SetFunctions(System.Object)" data-throw-if-not-resolved="false"></xref>):</b> Each step may declare a functions whitelist. The whitelist is applied in-memory at the start of each LLM turn. CRITICALLY: if a step does NOT declare a functions field, it INHERITS the previous step's active set. See <xref href="SignalWire.Contexts.Step.SetFunctions(System.Object)" data-throw-if-not-resolved="false"></xref> for details and examples.</p>
- [`GatherInfo`](/reference/dotnet/signal-wire.contexts/gather-info)
- [`GatherQuestion`](/reference/dotnet/signal-wire.contexts/gather-question)
- [`ReservedToolNames`](/reference/dotnet/signal-wire.contexts/reserved-tool-names) — Reserved tool names auto-injected by the runtime when contexts/steps are present. User-defined SWAIG tools must not collide with these names. <ul><li><code>next\_step</code> / <code>change\_context</code> are injected when valid\_steps or valid\_contexts is set so the model can navigate the flow.</li><li><code>gather\_submit</code> is injected while a step's gather\_info is collecting answers.</li></ul> <xref href="SignalWire.Contexts.ContextBuilder.Validate" data-throw-if-not-resolved="false"></xref> rejects any agent that registers a user tool sharing one of these names — the runtime would never call the user tool because the native one wins.
- [`Step`](/reference/dotnet/signal-wire.contexts/step)
