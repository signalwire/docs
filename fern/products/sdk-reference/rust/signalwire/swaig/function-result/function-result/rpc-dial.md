---
slug: "/reference/rust/signalwire/swaig/function-result/function-result/rpc-dial"
title: "rpc_dial"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swaig::function_result::FunctionResult::rpc_dial"
  parent: "signalwire::swaig::function_result::FunctionResult"
  module: "swaig.function_result"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs"
  visibility: "public"
---
# `rpc_dial`

## Signature

```rust
fn rpc_dial(
    &mut self,
    to: &str,
    from: &str,
    dest_swml: ?<&str>,
    call_timeout: ?<i64>,
    region: &str
) -> &mut Self
```

## Parameters

| Name           | Type      | Required | Default | Description |
| -------------- | --------- | -------- | ------- | ----------- |
| `to`           | `&str`    | yes      | —       | —           |
| `from`         | `&str`    | yes      | —       | —           |
| `dest_swml`    | `?<&str>` | yes      | —       | —           |
| `call_timeout` | `?<i64>`  | yes      | —       | —           |
| `region`       | `&str`    | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/swaig/function_result.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs)

Line 444.
