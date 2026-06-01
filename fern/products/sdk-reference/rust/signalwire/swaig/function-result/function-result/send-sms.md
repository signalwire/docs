---
slug: "/reference/rust/signalwire/swaig/function-result/function-result/send-sms"
title: "send_sms"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swaig::function_result::FunctionResult::send_sms"
  parent: "signalwire::swaig::function_result::FunctionResult"
  module: "swaig.function_result"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs"
  visibility: "public"
---
# `send_sms`

## Signature

```rust
fn send_sms(
    &mut self,
    to: &str,
    from: &str,
    body: &str,
    media: ?<&str>,
    tags: ?<&str>
) -> &mut Self
```

## Parameters

| Name    | Type      | Required | Default | Description |
| ------- | --------- | -------- | ------- | ----------- |
| `to`    | `&str`    | yes      | —       | —           |
| `from`  | `&str`    | yes      | —       | —           |
| `body`  | `&str`    | yes      | —       | —           |
| `media` | `?<&str>` | yes      | —       | —           |
| `tags`  | `?<&str>` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/swaig/function_result.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs)

Line 389.
