---
slug: "/reference/rust/signalwire/contexts/context-builder/step"
title: "Step"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::contexts::context_builder::Step"
  parent: "signalwire::contexts::context_builder"
  module: "contexts.context_builder"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs"
  visibility: "public"
---
# `Step`

A single step within a context.

## Signature

```rust
struct Step { /* fields */ }
```

## Inheritance

**Implements:** `Debug`, `Clone`

## Methods

- [`add_gather_question`](/reference/rust/signalwire/contexts/context-builder/step/add-gather-question) — Add a question to this step's gather\_info. Initialises gather\_info if needed.
- [`add_section`](/reference/rust/signalwire/contexts/context-builder/step/add-section) — Add a POM section with title and body.
- [`clone`](/reference/rust/signalwire/contexts/context-builder/step/clone)
- [`fmt`](/reference/rust/signalwire/contexts/context-builder/step/fmt)
- [`gather_info`](/reference/rust/signalwire/contexts/context-builder/step/gather-info)
- [`name`](/reference/rust/signalwire/contexts/context-builder/step/name)
- [`new`](/reference/rust/signalwire/contexts/context-builder/step/new)
- [`set_end`](/reference/rust/signalwire/contexts/context-builder/step/set-end) — Mark this step as terminal for the step flow.
- [`set_functions`](/reference/rust/signalwire/contexts/context-builder/step/set-functions) — Set which non-internal functions are callable while this step is active.
- [`set_gather_info`](/reference/rust/signalwire/contexts/context-builder/step/set-gather-info) — Initialise gather\_info for this step.
- [`set_skip_user_turn`](/reference/rust/signalwire/contexts/context-builder/step/set-skip-user-turn)
- [`set_step_criteria`](/reference/rust/signalwire/contexts/context-builder/step/set-step-criteria)
- [`set_text`](/reference/rust/signalwire/contexts/context-builder/step/set-text) — Set the step's prompt text directly. Mutually exclusive with POM sections.
- [`set_valid_contexts`](/reference/rust/signalwire/contexts/context-builder/step/set-valid-contexts)
- [`set_valid_steps`](/reference/rust/signalwire/contexts/context-builder/step/set-valid-steps)
- [`to_value`](/reference/rust/signalwire/contexts/context-builder/step/to-value)
- [`valid_contexts`](/reference/rust/signalwire/contexts/context-builder/step/valid-contexts)
- [`valid_steps`](/reference/rust/signalwire/contexts/context-builder/step/valid-steps)

## Source

[`src/contexts/context_builder.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs)

Line 159.
