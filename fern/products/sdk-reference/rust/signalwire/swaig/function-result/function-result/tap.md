---
slug: "/reference/rust/signalwire/swaig/function-result/function-result/tap"
title: "tap"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swaig::function_result::FunctionResult::tap"
  parent: "signalwire::swaig::function_result::FunctionResult"
  module: "swaig.function_result"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs"
  visibility: "public"
---
# `tap`

## Signature

```rust
fn tap(
    &mut self,
    uri: &str,
    control_id: &str,
    direction: &str,
    codec: &str
) -> &mut Self
```

## Parameters

| Name         | Type   | Required | Default | Description |
| ------------ | ------ | -------- | ------- | ----------- |
| `uri`        | `&str` | yes      | —       | —           |
| `control_id` | `&str` | yes      | —       | —           |
| `direction`  | `&str` | yes      | —       | —           |
| `codec`      | `&str` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/swaig/function_result.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs)

Line 362.
