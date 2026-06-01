---
slug: "/reference/rust/signalwire/datamap/datamap/data-map/description"
title: "description"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::datamap::datamap::DataMap::description"
  parent: "signalwire::datamap::datamap::DataMap"
  module: "datamap.datamap"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/datamap/datamap.rs"
  visibility: "public"
---
# `description`

Alias for \[`Self::purpose`]. Sets the LLM-facing tool
description. This string is read by the model to decide WHEN
to call this tool. See \[`Self::purpose`] for bad-vs-good
examples.

## Signature

```rust
fn description(&mut self, desc: &str) -> &mut Self
```

## Parameters

| Name   | Type   | Required | Default | Description |
| ------ | ------ | -------- | ------- | ----------- |
| `desc` | `&str` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/datamap/datamap.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/datamap/datamap.rs)

Line 67.
