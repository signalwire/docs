---
slug: "/reference/rust/signalwire/contexts/context-builder"
title: "context_builder"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "module"
  language: "rust"
  qualified_name: "signalwire::contexts::context_builder"
  parent: "signalwire::contexts"
  module: "contexts"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs"
  visibility: "public"
---
# `context_builder`

## Constants

| Name                         | Type                                        | Required | Default | Description                                                                                                                                                                                                                                                                                                                   |
| ---------------------------- | ------------------------------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `RESERVED_NATIVE_TOOL_NAMES` | `const RESERVED_NATIVE_TOOL_NAMES: &[&str]` | yes      | —       | Reserved tool names auto-injected by the runtime when contexts/steps are present. User-defined SWAIG tools must not collide with these names: \[`ContextBuilder::validate`] rejects any agent that registers a user tool sharing one of these names — the runtime would never call the user tool because the native one wins. |

## Functions

- [`create_simple_context`](/reference/rust/signalwire/contexts/context-builder/create-simple-context) — Create a builder pre-populated with a single named context.

## Classes

- [`Context`](/reference/rust/signalwire/contexts/context-builder/context) — A named context containing an ordered set of steps.
- [`ContextBuilder`](/reference/rust/signalwire/contexts/context-builder/context-builder) — Builder for multi-step, multi-context AI agent workflows.
- [`GatherInfo`](/reference/rust/signalwire/contexts/context-builder/gather-info) — Configuration for structured data gathering within a step.
- [`GatherQuestion`](/reference/rust/signalwire/contexts/context-builder/gather-question) — A single question within a gather\_info block.
- [`Step`](/reference/rust/signalwire/contexts/context-builder/step) — A single step within a context.

## Source

[`src/contexts/context_builder.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs)

Line 1.
