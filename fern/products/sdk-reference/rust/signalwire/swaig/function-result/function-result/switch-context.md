---
slug: "/reference/rust/signalwire/swaig/function-result/function-result/switch-context"
title: "switch_context"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swaig::function_result::FunctionResult::switch_context"
  parent: "signalwire::swaig::function_result::FunctionResult"
  module: "swaig.function_result"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs"
  visibility: "public"
---
# `switch_context`

## Signature

```rust
fn switch_context(
    &mut self,
    system_prompt: &str,
    user_prompt: &str,
    consolidate: bool,
    full_reset: bool,
    isolated: bool
) -> &mut Self
```

## Parameters

| Name            | Type   | Required | Default | Description |
| --------------- | ------ | -------- | ------- | ----------- |
| `system_prompt` | `&str` | yes      | —       | —           |
| `user_prompt`   | `&str` | yes      | —       | —           |
| `consolidate`   | `bool` | yes      | —       | —           |
| `full_reset`    | `bool` | yes      | —       | —           |
| `isolated`      | `bool` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/swaig/function_result.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs)

Line 191.
