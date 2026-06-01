---
slug: "/reference/rust/signalwire/contexts/context-builder/context-builder"
title: "ContextBuilder"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::contexts::context_builder::ContextBuilder"
  parent: "signalwire::contexts::context_builder"
  module: "contexts.context_builder"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs"
  visibility: "public"
---
# `ContextBuilder`

Builder for multi-step, multi-context AI agent workflows.

A ContextBuilder owns one or more \[`Context`]s; each Context owns an
ordered list of \[`Step`]s. Only one context and one step is active at
a time. Per chat turn, the runtime injects the current step's
instructions as a system message, then asks the LLM for a response.

# Native tools auto-injected by the runtime

When a step (or its enclosing context) declares valid\_steps or
valid\_contexts, the runtime auto-injects two native tools so the
model can navigate the flow:

- `next_step(step: enum)`         — present when valid\_steps is set
- `change_context(context: enum)` — present when valid\_contexts is set

A third native tool — `gather_submit` — is injected during
gather\_info questioning. These three names are reserved: see
\[`RESERVED_NATIVE_TOOL_NAMES`]. \[`ContextBuilder::validate`] rejects
any agent that defines a SWAIG tool with one of these names.

# Function whitelisting (\[`Step::set_functions`])

Each step may declare a functions whitelist. The whitelist is applied
in-memory at the start of each LLM turn. CRITICALLY: if a step does
NOT declare a functions field, it INHERITS the previous step's
active set. See \[`Step::set_functions`] for details and examples.

## Signature

```rust
struct ContextBuilder { /* fields */ }
```

## Inheritance

**Implements:** `Clone`, `Debug`, `Default`

## Methods

- [`add_context`](/reference/rust/signalwire/contexts/context-builder/context-builder/add-context)
- [`attach_tool_name_supplier`](/reference/rust/signalwire/contexts/context-builder/context-builder/attach-tool-name-supplier) — Attach a closure that returns registered SWAIG tool names so \[`Self::validate`] can check for collisions with \[`RESERVED_NATIVE_TOOL_NAMES`].
- [`clone`](/reference/rust/signalwire/contexts/context-builder/context-builder/clone)
- [`default`](/reference/rust/signalwire/contexts/context-builder/context-builder/default)
- [`fmt`](/reference/rust/signalwire/contexts/context-builder/context-builder/fmt)
- [`get_context`](/reference/rust/signalwire/contexts/context-builder/context-builder/get-context)
- [`get_context_mut`](/reference/rust/signalwire/contexts/context-builder/context-builder/get-context-mut)
- [`has_contexts`](/reference/rust/signalwire/contexts/context-builder/context-builder/has-contexts)
- [`new`](/reference/rust/signalwire/contexts/context-builder/context-builder/new)
- [`reset`](/reference/rust/signalwire/contexts/context-builder/context-builder/reset) — Remove all contexts, returning the builder to its initial state. Use this in a dynamic config callback when you need to rebuild contexts from scratch for a specific request.
- [`to_value`](/reference/rust/signalwire/contexts/context-builder/context-builder/to-value) — Serialise all contexts in order. Validates before converting.
- [`validate`](/reference/rust/signalwire/contexts/context-builder/context-builder/validate) — Validate the contexts configuration. Returns `Ok(())` if valid, `Err(errors)` with a list of error messages.

## Source

[`src/contexts/context_builder.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs)

Line 597.
