---
slug: "/reference/rust/signalwire/serverless/adapter/runtime-environment"
title: "RuntimeEnvironment"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "enum"
  language: "rust"
  qualified_name: "signalwire::serverless::adapter::RuntimeEnvironment"
  parent: "signalwire::serverless::adapter"
  module: "serverless.adapter"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/serverless/adapter.rs"
  visibility: "public"
---
# `RuntimeEnvironment`

Detected runtime environment.

## Signature

```rust
enum RuntimeEnvironment
```

## Inheritance

**Implements:** `Debug`, `Clone`, `PartialEq`, `Eq`

## Variants

| Name     | Type     | Required | Default | Description |
| -------- | -------- | -------- | ------- | ----------- |
| `Azure`  | `Azure`  | yes      | —       | —           |
| `Cgi`    | `Cgi`    | yes      | —       | —           |
| `Gcf`    | `Gcf`    | yes      | —       | —           |
| `Lambda` | `Lambda` | yes      | —       | —           |
| `Server` | `Server` | yes      | —       | —           |

## Methods

- [`as_str`](/reference/rust/signalwire/serverless/adapter/runtime-environment/as-str)
- [`clone`](/reference/rust/signalwire/serverless/adapter/runtime-environment/clone)
- [`eq`](/reference/rust/signalwire/serverless/adapter/runtime-environment/eq)
- [`fmt`](/reference/rust/signalwire/serverless/adapter/runtime-environment/fmt)

## Source

[`src/serverless/adapter.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/serverless/adapter.rs)

Line 6.
