---
slug: "/reference/rust/signalwire/swaig/function-result/function-result/pay"
title: "pay"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swaig::function_result::FunctionResult::pay"
  parent: "signalwire::swaig::function_result::FunctionResult"
  module: "swaig.function_result"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs"
  visibility: "public"
---
# `pay`

## Signature

```rust
fn pay(
    &mut self,
    connector_url: &str,
    input_method: &str,
    action_url: &str,
    timeout: i64,
    max_attempts: i64
) -> &mut Self
```

## Parameters

| Name            | Type   | Required | Default | Description |
| --------------- | ------ | -------- | ------- | ----------- |
| `connector_url` | `&str` | yes      | —       | —           |
| `input_method`  | `&str` | yes      | —       | —           |
| `action_url`    | `&str` | yes      | —       | —           |
| `timeout`       | `i64`  | yes      | —       | —           |
| `max_attempts`  | `i64`  | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/swaig/function_result.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs)

Line 411.
