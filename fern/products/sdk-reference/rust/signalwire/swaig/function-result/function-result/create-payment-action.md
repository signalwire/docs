---
slug: "/reference/rust/signalwire/swaig/function-result/function-result/create-payment-action"
title: "create_payment_action"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swaig::function_result::FunctionResult::create_payment_action"
  parent: "signalwire::swaig::function_result::FunctionResult"
  module: "swaig.function_result"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs"
  visibility: "public"
---
# `create_payment_action`

## Signature

```rust
fn create_payment_action(
    action_type: &str,
    text: &str,
    language: &str,
    voice: &str
) -> ?
```

## Parameters

| Name          | Type   | Required | Default | Description |
| ------------- | ------ | -------- | ------- | ----------- |
| `action_type` | `&str` | yes      | —       | —           |
| `text`        | `&str` | yes      | —       | —           |
| `language`    | `&str` | yes      | —       | —           |
| `voice`       | `&str` | yes      | —       | —           |

## Returns

`?`

## Source

[`src/swaig/function_result.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs)

Line 497.
