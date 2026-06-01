---
slug: "/reference/rust/signalwire/relay/action/action/on-completed"
title: "on_completed"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::action::Action::on_completed"
  parent: "signalwire::relay::action::Action"
  module: "relay.action"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/action.rs"
  visibility: "public"
---
# `on_completed`

Register a callback to fire when the action completes.
If the action is already done, the callback fires immediately.

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

[`src/relay/action.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/action.rs)

Line 123.
