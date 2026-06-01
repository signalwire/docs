---
slug: "/reference/rust/signalwire/utils/schema-utils/schema-utils/get-verb-properties"
title: "get_verb_properties"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::utils::schema_utils::SchemaUtils::get_verb_properties"
  parent: "signalwire::utils::schema_utils::SchemaUtils"
  module: "utils.schema_utils"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/utils/schema_utils.rs"
  visibility: "public"
---
# `get_verb_properties`

The `properties[verb_name]` block for a verb, or empty when
unknown.  Mirrors Python's `get_verb_properties(verb_name)`.

## Signature

```rust
fn get_verb_properties(&self, verb_name: &str) -> ?<?, ?>
```

## Parameters

| Name        | Type   | Required | Default | Description |
| ----------- | ------ | -------- | ------- | ----------- |
| `verb_name` | `&str` | yes      | —       | —           |

## Returns

`?<?, ?>`

## Source

[`src/utils/schema_utils.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/utils/schema_utils.rs)

Line 116.
