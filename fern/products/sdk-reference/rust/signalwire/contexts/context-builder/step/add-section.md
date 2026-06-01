---
slug: "/reference/rust/signalwire/contexts/context-builder/step/add-section"
title: "add_section"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::contexts::context_builder::Step::add_section"
  parent: "signalwire::contexts::context_builder::Step"
  module: "contexts.context_builder"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs"
  visibility: "public"
---
# `add_section`

Add a POM section with title and body.

## Signature

```rust
fn add_section(&mut self, title: &str, body: &str) -> &mut Self
```

## Parameters

| Name    | Type   | Required | Default | Description |
| ------- | ------ | -------- | ------- | ----------- |
| `title` | `&str` | yes      | —       | —           |
| `body`  | `&str` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/contexts/context_builder.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs)

Line 203.
