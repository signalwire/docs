---
slug: "/reference/rust/signalwire/datamap/datamap/data-map/create-simple-api-tool"
title: "create_simple_api_tool"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::datamap::datamap::DataMap::create_simple_api_tool"
  parent: "signalwire::datamap::datamap::DataMap"
  module: "datamap.datamap"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/datamap/datamap.rs"
  visibility: "public"
---
# `create_simple_api_tool`

Build a complete SWAIG function definition with a single webhook.

## Signature

```rust
fn create_simple_api_tool(
    name: &str,
    purpose: &str,
    parameters: ?<?>,
    method: &str,
    url: &str,
    output: ?,
    headers: ?
) -> ?
```

## Parameters

| Name         | Type   | Required | Default | Description |
| ------------ | ------ | -------- | ------- | ----------- |
| `name`       | `&str` | yes      | —       | —           |
| `purpose`    | `&str` | yes      | —       | —           |
| `parameters` | `?<?>` | yes      | —       | —           |
| `method`     | `&str` | yes      | —       | —           |
| `url`        | `&str` | yes      | —       | —           |
| `output`     | `?`    | yes      | —       | —           |
| `headers`    | `?`    | yes      | —       | —           |

## Returns

`?`

## Source

[`src/datamap/datamap.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/datamap/datamap.rs)

Line 276.
