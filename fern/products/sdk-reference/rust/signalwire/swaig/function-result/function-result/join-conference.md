---
slug: "/reference/rust/signalwire/swaig/function-result/function-result/join-conference"
title: "join_conference"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swaig::function_result::FunctionResult::join_conference"
  parent: "signalwire::swaig::function_result::FunctionResult"
  module: "swaig.function_result"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs"
  visibility: "public"
---
# `join_conference`

## Signature

```rust
fn join_conference(
    &mut self,
    name: &str,
    muted: bool,
    beep: &str,
    hold_audio: &str
) -> &mut Self
```

## Parameters

| Name         | Type   | Required | Default | Description |
| ------------ | ------ | -------- | ------- | ----------- |
| `name`       | `&str` | yes      | —       | —           |
| `muted`      | `bool` | yes      | —       | —           |
| `beep`       | `&str` | yes      | —       | —           |
| `hold_audio` | `&str` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/swaig/function_result.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs)

Line 334.
