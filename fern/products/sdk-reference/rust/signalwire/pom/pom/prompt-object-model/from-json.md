---
slug: "/reference/rust/signalwire/pom/pom/prompt-object-model/from-json"
title: "from_json"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::pom::pom::PromptObjectModel::from_json"
  parent: "signalwire::pom::pom::PromptObjectModel"
  module: "pom.pom"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/pom/pom.rs"
  visibility: "public"
---
# `from_json`

Parse a JSON string into a \[`PromptObjectModel`]. Mirrors
Python's `PromptObjectModel.from_json(json_data)`.

Returns `Err(String)` with a descriptive message on parse
errors, matching Python's `ValueError`.

## Signature

```rust
fn from_json(json_str: &str) -> ?<Self, ?>
```

## Parameters

| Name       | Type   | Required | Default | Description |
| ---------- | ------ | -------- | ------- | ----------- |
| `json_str` | `&str` | yes      | —       | —           |

## Returns

`?<Self, ?>`

## Source

[`src/pom/pom.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/pom/pom.rs)

Line 54.
