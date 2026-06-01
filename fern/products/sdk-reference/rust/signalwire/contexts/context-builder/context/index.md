---
slug: "/reference/rust/signalwire/contexts/context-builder/context"
title: "Context"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::contexts::context_builder::Context"
  parent: "signalwire::contexts::context_builder"
  module: "contexts.context_builder"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs"
  visibility: "public"
---
# `Context`

A named context containing an ordered set of steps.

## Signature

```rust
struct Context { /* fields */ }
```

## Inheritance

**Implements:** `Debug`, `Clone`

## Methods

- [`add_step`](/reference/rust/signalwire/contexts/context-builder/context/add-step)
- [`clone`](/reference/rust/signalwire/contexts/context-builder/context/clone)
- [`fmt`](/reference/rust/signalwire/contexts/context-builder/context/fmt)
- [`get_step`](/reference/rust/signalwire/contexts/context-builder/context/get-step)
- [`get_step_mut`](/reference/rust/signalwire/contexts/context-builder/context/get-step-mut)
- [`move_step`](/reference/rust/signalwire/contexts/context-builder/context/move-step)
- [`name`](/reference/rust/signalwire/contexts/context-builder/context/name)
- [`new`](/reference/rust/signalwire/contexts/context-builder/context/new)
- [`remove_step`](/reference/rust/signalwire/contexts/context-builder/context/remove-step)
- [`set_enter_fillers`](/reference/rust/signalwire/contexts/context-builder/context/set-enter-fillers)
- [`set_exit_fillers`](/reference/rust/signalwire/contexts/context-builder/context/set-exit-fillers)
- [`set_initial_step`](/reference/rust/signalwire/contexts/context-builder/context/set-initial-step) — Set which step the context starts on when entered.
- [`set_prompt_text`](/reference/rust/signalwire/contexts/context-builder/context/set-prompt-text)
- [`set_system_prompt`](/reference/rust/signalwire/contexts/context-builder/context/set-system-prompt)
- [`step_order`](/reference/rust/signalwire/contexts/context-builder/context/step-order)
- [`steps`](/reference/rust/signalwire/contexts/context-builder/context/steps)
- [`to_value`](/reference/rust/signalwire/contexts/context-builder/context/to-value)

## Source

[`src/contexts/context_builder.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs)

Line 408.
