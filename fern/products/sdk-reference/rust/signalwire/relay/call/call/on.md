---
slug: "/reference/rust/signalwire/relay/call/call/on"
title: "on"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::call::Call::on"
  parent: "signalwire::relay::call::Call"
  module: "relay.call"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/call.rs"
  visibility: "public"
---
# `on`

Register a generic event listener on this call.

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

[`src/relay/call.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/call.rs)

Line 169.
