---
slug: "/reference/rust/signalwire/datamap/datamap/data-map/expression"
title: "expression"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::datamap::datamap::DataMap::expression"
  parent: "signalwire::datamap::datamap::DataMap"
  module: "datamap.datamap"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/datamap/datamap.rs"
  visibility: "public"
---
# `expression`

Add an expression rule.

## Signature

```rust
fn expression(
    &mut self,
    test_value: &str,
    pattern: &str,
    output: ?,
    nomatch_output: ?<?>
) -> &mut Self
```

## Parameters

| Name             | Type   | Required | Default | Description |
| ---------------- | ------ | -------- | ------- | ----------- |
| `test_value`     | `&str` | yes      | —       | —           |
| `pattern`        | `&str` | yes      | —       | —           |
| `output`         | `?`    | yes      | —       | —           |
| `nomatch_output` | `?<?>` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/datamap/datamap.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/datamap/datamap.rs)

Line 113.
