---
slug: "/reference/rust/signalwire/relay/message/message/on"
title: "on"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::message::Message::on"
  parent: "signalwire::relay::message::Message"
  module: "relay.message"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/message.rs"
  visibility: "public"
---
# `on`

Register a listener that fires on every state-change event.

## Signature

```rust
fn on<F: ?(&?, &?) + ? + ? + 'static>(&self, cb: F)
```

## Type Parameters

| Name | Type                          | Required | Default | Description |
| ---- | ----------------------------- | -------- | ------- | ----------- |
| `F`  | `?(&?, &?) + ? + ? + 'static` | yes      | —       | —           |

## Parameters

| Name | Type | Required | Default | Description |
| ---- | ---- | -------- | ------- | ----------- |
| `cb` | `F`  | yes      | —       | —           |

## Source

[`src/relay/message.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/message.rs)

Line 222.
