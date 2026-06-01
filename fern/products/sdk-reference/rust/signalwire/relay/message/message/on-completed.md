---
slug: "/reference/rust/signalwire/relay/message/message/on-completed"
title: "on_completed"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::message::Message::on_completed"
  parent: "signalwire::relay::message::Message"
  module: "relay.message"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/message.rs"
  visibility: "public"
---
# `on_completed`

Register a callback to fire when the message reaches a terminal state.

## Signature

```rust
fn on_completed<F: ?(&?) + ? + 'static>(&self, cb: F)
```

## Type Parameters

| Name | Type                  | Required | Default | Description |
| ---- | --------------------- | -------- | ------- | ----------- |
| `F`  | `?(&?) + ? + 'static` | yes      | —       | —           |

## Parameters

| Name | Type | Required | Default | Description |
| ---- | ---- | -------- | ------- | ----------- |
| `cb` | `F`  | yes      | —       | —           |

## Source

[`src/relay/message.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/message.rs)

Line 230.
