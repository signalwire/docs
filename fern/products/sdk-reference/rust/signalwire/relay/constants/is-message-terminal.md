---
slug: "/reference/rust/signalwire/relay/constants/is-message-terminal"
title: "is_message_terminal"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "function"
  language: "rust"
  qualified_name: "signalwire::relay::constants::is_message_terminal"
  parent: "signalwire::relay::constants"
  module: "relay.constants"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/constants.rs"
  visibility: "public"
---
# `is_message_terminal`

Returns `true` when the message state is terminal.

## Signature

```rust
fn is_message_terminal(state: &str) -> bool
```

## Parameters

| Name    | Type   | Required | Default | Description |
| ------- | ------ | -------- | ------- | ----------- |
| `state` | `&str` | yes      | —       | —           |

## Returns

`bool`

## Source

[`src/relay/constants.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/constants.rs)

Line 47.
