---
slug: "/reference/rust/signalwire/relay/client/client/on-event"
title: "on_event"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::client::Client::on_event"
  parent: "signalwire::relay::client::Client"
  module: "relay.client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs"
  visibility: "public"
---
# `on_event`

Register a generic event handler.

## Signature

```rust
fn on_event<F: ?(&?, &?) + ? + ? + 'static>(&self, cb: F)
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

[`src/relay/client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs)

Line 692.
