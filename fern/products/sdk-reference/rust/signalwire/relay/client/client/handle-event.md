---
slug: "/reference/rust/signalwire/relay/client/client/handle-event"
title: "handle_event"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::client::Client::handle_event"
  parent: "signalwire::relay::client::Client"
  module: "relay.client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs"
  visibility: "public"
---
# `handle_event`

Route a signalwire.event payload to the appropriate handler.

## Signature

```rust
fn handle_event(&self, outer_params: &?)
```

## Parameters

| Name           | Type | Required | Default | Description |
| -------------- | ---- | -------- | ------- | ----------- |
| `outer_params` | `&?` | yes      | —       | —           |

## Source

[`src/relay/client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs)

Line 553.
