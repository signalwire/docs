---
slug: "/reference/rust/signalwire/utils/schema-utils/schema-utils/generate-method-signature"
title: "generate_method_signature"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::utils::schema_utils::SchemaUtils::generate_method_signature"
  parent: "signalwire::utils::schema_utils::SchemaUtils"
  module: "utils.schema_utils"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/utils/schema_utils.rs"
  visibility: "public"
---
# `generate_method_signature`

Generate a Python-style method signature string for a verb.
Mirrors Python's `generate_method_signature(verb_name)`.

## Signature

```rust
fn generate_method_signature(&self, verb_name: &str) -> ?
```

## Parameters

| Name        | Type   | Required | Default | Description |
| ----------- | ------ | -------- | ------- | ----------- |
| `verb_name` | `&str` | yes      | —       | —           |

## Returns

`?`

## Source

[`src/utils/schema_utils.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/utils/schema_utils.rs)

Line 202.
