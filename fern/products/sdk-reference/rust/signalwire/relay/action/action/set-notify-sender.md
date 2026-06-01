---
slug: "/reference/rust/signalwire/relay/action/action/set-notify-sender"
title: "set_notify_sender"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::action::Action::set_notify_sender"
  parent: "signalwire::relay::action::Action"
  module: "relay.action"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/action.rs"
  visibility: "public"
---
# `set_notify_sender`

Install a channel sender so that `wait_sync()` can block until
the action resolves.

## Signature

```rust
fn set_notify_sender(&self, tx: ?<()>)
```

## Parameters

| Name | Type    | Required | Default | Description |
| ---- | ------- | -------- | ------- | ----------- |
| `tx` | `?<()>` | yes      | —       | —           |

## Source

[`src/relay/action.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/action.rs)

Line 113.
