---
slug: "/reference/rust/signalwire/datamap/datamap/data-map"
title: "DataMap"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::datamap::datamap::DataMap"
  parent: "signalwire::datamap::datamap"
  module: "datamap.datamap"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/datamap/datamap.rs"
  visibility: "public"
---
# `DataMap`

Fluent builder for DataMap-based SWAIG function definitions.

A DataMap tool defines its behaviour declaratively (expressions, webhooks)
instead of with a code handler.

## Signature

```rust
struct DataMap { /* fields */ }
```

## Inheritance

**Implements:** `Debug`, `Clone`

## Methods

- [`body`](/reference/rust/signalwire/datamap/datamap/data-map/body) — Set body on the last webhook.
- [`clone`](/reference/rust/signalwire/datamap/datamap/data-map/clone)
- [`create_expression_tool`](/reference/rust/signalwire/datamap/datamap/data-map/create-expression-tool) — Build a complete SWAIG function definition with expressions only.
- [`create_simple_api_tool`](/reference/rust/signalwire/datamap/datamap/data-map/create-simple-api-tool) — Build a complete SWAIG function definition with a single webhook.
- [`description`](/reference/rust/signalwire/datamap/datamap/data-map/description) — Alias for \[`Self::purpose`]. Sets the LLM-facing tool description. This string is read by the model to decide WHEN to call this tool. See \[`Self::purpose`] for bad-vs-good examples.
- [`error_keys`](/reference/rust/signalwire/datamap/datamap/data-map/error-keys) — Set error\_keys on the last webhook.
- [`expression`](/reference/rust/signalwire/datamap/datamap/data-map/expression) — Add an expression rule.
- [`fallback_output`](/reference/rust/signalwire/datamap/datamap/data-map/fallback-output) — Set global fallback output.
- [`fmt`](/reference/rust/signalwire/datamap/datamap/data-map/fmt)
- [`for_each`](/reference/rust/signalwire/datamap/datamap/data-map/for-each) — Set foreach on the last webhook.
- [`global_error_keys`](/reference/rust/signalwire/datamap/datamap/data-map/global-error-keys) — Set global error\_keys.
- [`new`](/reference/rust/signalwire/datamap/datamap/data-map/new)
- [`output`](/reference/rust/signalwire/datamap/datamap/data-map/output) — Set output on the last webhook.
- [`parameter`](/reference/rust/signalwire/datamap/datamap/data-map/parameter) — Add a parameter definition — the `description` is **LLM-FACING**.
- [`params`](/reference/rust/signalwire/datamap/datamap/data-map/params) — Set params on the last webhook.
- [`purpose`](/reference/rust/signalwire/datamap/datamap/data-map/purpose) — Set the LLM-facing tool description (the "purpose"). **Prompt engineering, not developer documentation.**
- [`to_swaig_function`](/reference/rust/signalwire/datamap/datamap/data-map/to-swaig-function) — Serialise to a SWAIG function definition.
- [`webhook`](/reference/rust/signalwire/datamap/datamap/data-map/webhook) — Add a webhook definition.
- [`webhook_expressions`](/reference/rust/signalwire/datamap/datamap/data-map/webhook-expressions) — Set expressions on the last webhook.

## Source

[`src/datamap/datamap.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/datamap/datamap.rs)

Line 9.
