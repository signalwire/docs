---
slug: "/reference/rust/signalwire/relay/client/client/receive"
title: "receive"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::client::Client::receive"
  parent: "signalwire::relay::client::Client"
  module: "relay.client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs"
  visibility: "public"
---
# `receive`

Subscribe to one or more inbound contexts.

## Signature

```rust
fn receive(&self, contexts: &[?])
```

## Parameters

| Name       | Type   | Required | Default | Description |
| ---------- | ------ | -------- | ------- | ----------- |
| `contexts` | `&[?]` | yes      | —       | —           |

## Source

[`src/relay/client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs)

Line 658.
