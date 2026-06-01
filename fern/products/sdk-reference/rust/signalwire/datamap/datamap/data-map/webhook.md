---
slug: "/reference/rust/signalwire/datamap/datamap/data-map/webhook"
title: "webhook"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::datamap::datamap::DataMap::webhook"
  parent: "signalwire::datamap::datamap::DataMap"
  module: "datamap.datamap"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/datamap/datamap.rs"
  visibility: "public"
---
# `webhook`

Add a webhook definition.

## Signature

```rust
fn webhook(
    &mut self,
    method: &str,
    url: &str,
    headers: ?,
    form_param: &str,
    input_args_as_params: bool,
    require_args: ?<&str>
) -> &mut Self
```

## Parameters

| Name                   | Type      | Required | Default | Description |
| ---------------------- | --------- | -------- | ------- | ----------- |
| `method`               | `&str`    | yes      | —       | —           |
| `url`                  | `&str`    | yes      | —       | —           |
| `headers`              | `?`       | yes      | —       | —           |
| `form_param`           | `&str`    | yes      | —       | —           |
| `input_args_as_params` | `bool`    | yes      | —       | —           |
| `require_args`         | `?<&str>` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/datamap/datamap.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/datamap/datamap.rs)

Line 132.
