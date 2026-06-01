---
slug: "/reference/cpp/signalwire/contexts/context-builder"
title: "ContextBuilder"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::contexts::ContextBuilder"
  parent: "signalwire::contexts"
  module: "signalwire.contexts"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp"
  visibility: "public"
---
# `ContextBuilder`

Builder for multi-step, multi-context AI agent workflows.
A ContextBuilder owns one or more Contexts; each Context owns an ordered list of Steps. Only one context and one step is active at a time. Per chat turn, the runtime injects the current step's instructions as a system message, then asks the LLM for a response.

Native tools auto-injected by the runtimeWhen a step (or its enclosing context) declares valid\_steps or valid\_contexts, the runtime auto-injects two native tools so the model can navigate the flow:

next\_step(step: enum) — present when valid\_steps is set
change\_context(context: enum) — present when valid\_contexts is set

A third native tool — gather\_submit — is injected during gather\_info questioning. These three names are reserved: validate() rejects any agent that defines a SWAIG tool with one of them. See reserved\_native\_tool\_names().

Function whitelisting (Step::set\_functions)Each step may declare a functions whitelist. The whitelist is applied in-memory at the start of each LLM turn. CRITICALLY: if a step does NOT declare a functions field, it INHERITS the previous step's active set. See Step::set\_functions for details and examples.

## Signature

```cpp
class signalwire::contexts::ContextBuilder
```

## Methods

- [`add_context`](/reference/cpp/signalwire/contexts/context-builder/add-context) — Add a new context.
- [`attach_tool_name_supplier`](/reference/cpp/signalwire/contexts/context-builder/attach-tool-name-supplier) — Attach a tool-name supplier so validate() can check user-defined SWAIG tool names against reserved\_native\_tool\_names(). AgentBase::define\_contexts() wires this up automatically.
- [`ContextBuilder`](/reference/cpp/signalwire/contexts/context-builder/context-builder)
- [`get_context`](/reference/cpp/signalwire/contexts/context-builder/get-context) — Get an existing context.
- [`has_contexts`](/reference/cpp/signalwire/contexts/context-builder/has-contexts)
- [`reset`](/reference/cpp/signalwire/contexts/context-builder/reset) — Remove all contexts, returning the builder to its initial state.
- [`to_json`](/reference/cpp/signalwire/contexts/context-builder/to-json) — Serialize all contexts to JSON.
- [`validate`](/reference/cpp/signalwire/contexts/context-builder/validate) — Validate all contexts. Checks: At least one context is defined A single context must be named "default" Every context has at least one step gather\_info completion\_action targets an existing step No user-defined SWAIG tool collides with a reserved native name (via the attached tool-name supplier)

## Source

[`include/signalwire/contexts/contexts.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/contexts/contexts.hpp)

Line 397.
