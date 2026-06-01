---
slug: "/reference/rust/signalwire/relay/constants/is-call-terminal"
title: "is_call_terminal"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "function"
  language: "rust"
  qualified_name: "signalwire::relay::constants::is_call_terminal"
  parent: "signalwire::relay::constants"
  module: "relay.constants"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/constants.rs"
  visibility: "public"
---
# `is_call_terminal`

Returns `true` when the call state is terminal (i.e. `"ended"`).

## Signature

```rust
fn is_call_terminal(state: &str) -> bool
```

## Parameters

| Name    | Type   | Required | Default | Description |
| ------- | ------ | -------- | ------- | ----------- |
| `state` | `&str` | yes      | —       | —           |

## Returns

`bool`

## Source

[`src/relay/constants.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/constants.rs)

Line 22.
