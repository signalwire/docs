---
slug: "/reference/rust/signalwire/swaig/function-result/function-result/to-value"
title: "to_value"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swaig::function_result::FunctionResult::to_value"
  parent: "signalwire::swaig::function_result::FunctionResult"
  module: "swaig.function_result"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs"
  visibility: "public"
---
# `to_value`

Serialise to a JSON value.

- `response` is always included.
- `action` is only included if at least one action exists.
- `post_process` is only included if `true`.

## Signature

```rust
fn to_value(&self) -> ?
```

## Returns

`?`

## Source

[`src/swaig/function_result.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swaig/function_result.rs)

Line 62.
