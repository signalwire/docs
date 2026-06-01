---
slug: "/reference/rust/signalwire/swaig/function-result/function-result/record-call"
title: "record_call"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swaig::function_result::FunctionResult::record_call"
  parent: "signalwire::swaig::function_result::FunctionResult"
  module: "swaig.function_result"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs"
  visibility: "public"
---
# `record_call`

## Signature

```rust
fn record_call(
    &mut self,
    control_id: &str,
    stereo: bool,
    format: &str,
    direction: &str
) -> &mut Self
```

## Parameters

| Name         | Type   | Required | Default | Description |
| ------------ | ------ | -------- | ------- | ----------- |
| `control_id` | `&str` | yes      | —       | —           |
| `stereo`     | `bool` | yes      | —       | —           |
| `format`     | `&str` | yes      | —       | —           |
| `direction`  | `&str` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/swaig/function_result.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs)

Line 249.
