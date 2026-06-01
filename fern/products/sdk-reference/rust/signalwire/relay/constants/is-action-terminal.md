---
slug: "/reference/rust/signalwire/relay/constants/is-action-terminal"
title: "is_action_terminal"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "function"
  language: "rust"
  qualified_name: "signalwire::relay::constants::is_action_terminal"
  parent: "signalwire::relay::constants"
  module: "relay.constants"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/constants.rs"
  visibility: "public"
---
# `is_action_terminal`

Returns `true` when the given `(event_type, action_state)` pair represents
a terminal state for an in-flight action.

## Signature

```rust
fn is_action_terminal(event_type: &str, state: &str) -> bool
```

## Parameters

| Name         | Type   | Required | Default | Description |
| ------------ | ------ | -------- | ------- | ----------- |
| `event_type` | `&str` | yes      | —       | —           |
| `state`      | `&str` | yes      | —       | —           |

## Returns

`bool`

## Source

[`src/relay/constants.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/constants.rs)

Line 60.
