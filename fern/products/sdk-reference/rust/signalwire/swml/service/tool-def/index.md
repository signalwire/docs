---
slug: "/reference/rust/signalwire/swml/service/tool-def"
title: "ToolDef"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::swml::service::ToolDef"
  parent: "signalwire::swml::service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `ToolDef`

Tool registered on a `Service` for SWAIG dispatch. The `definition`
field holds the rendered SWAIG function dict (function/purpose/argument);
`handler` is `None` for raw / DataMap-style functions, where dispatch
happens server-side rather than in this process.

## Signature

```rust
struct ToolDef { /* fields */ }
```

## Inheritance

**Implements:** `Clone`

## Properties

| Name         | Type      | Required | Default | Description |
| ------------ | --------- | -------- | ------- | ----------- |
| `definition` | `?`       | yes      | —       | —           |
| `handler`    | `?<?<?>>` | yes      | —       | —           |
| `secure`     | `bool`    | yes      | —       | —           |

## Methods

- [`clone`](/reference/rust/signalwire/swml/service/tool-def/clone)

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 85.
