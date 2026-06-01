---
slug: "/reference/rust/signalwire/contexts/context-builder/context/set-initial-step"
title: "set_initial_step"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::contexts::context_builder::Context::set_initial_step"
  parent: "signalwire::contexts::context_builder::Context"
  module: "contexts.context_builder"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs"
  visibility: "public"
---
# `set_initial_step`

Set which step the context starts on when entered.

By default, a context starts on its first step (index 0). Use
this to skip a preamble step on re-entry via `change_context`.

## Signature

```rust
fn set_initial_step(&mut self, step_name: &str) -> &mut Self
```

## Parameters

| Name        | Type   | Required | Default | Description |
| ----------- | ------ | -------- | ------- | ----------- |
| `step_name` | `&str` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/contexts/context_builder.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs)

Line 493.
