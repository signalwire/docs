---
slug: "/reference/rust/signalwire/datamap/datamap/data-map/create-expression-tool"
title: "create_expression_tool"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::datamap::datamap::DataMap::create_expression_tool"
  parent: "signalwire::datamap::datamap::DataMap"
  module: "datamap.datamap"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/datamap/datamap.rs"
  visibility: "public"
---
# `create_expression_tool`

Build a complete SWAIG function definition with expressions only.

## Signature

```rust
fn create_expression_tool(
    name: &str,
    purpose: &str,
    parameters: ?<?>,
    expressions: ?<?>
) -> ?
```

## Parameters

| Name          | Type   | Required | Default | Description |
| ------------- | ------ | -------- | ------- | ----------- |
| `name`        | `&str` | yes      | —       | —           |
| `purpose`     | `&str` | yes      | —       | —           |
| `parameters`  | `?<?>` | yes      | —       | —           |
| `expressions` | `?<?>` | yes      | —       | —           |

## Returns

`?`

## Source

[`src/datamap/datamap.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/datamap/datamap.rs)

Line 307.
