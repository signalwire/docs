---
slug: "/reference/rust/signalwire/relay/action/fax-action/new"
title: "new"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::action::FaxAction::new"
  parent: "signalwire::relay::action::FaxAction"
  module: "relay.action"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/action.rs"
  visibility: "public"
---
# `new`

## Signature

```rust
fn new(control_id: &str, call_id: &str, node_id: &str, fax_type: &str) -> Self
```

## Parameters

| Name         | Type   | Required | Default | Description |
| ------------ | ------ | -------- | ------- | ----------- |
| `control_id` | `&str` | yes      | —       | —           |
| `call_id`    | `&str` | yes      | —       | —           |
| `node_id`    | `&str` | yes      | —       | —           |
| `fax_type`   | `&str` | yes      | —       | —           |

## Returns

`Self`

## Source

[`src/relay/action.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/action.rs)

Line 391.
