---
slug: "/reference/rust/signalwire/relay/client/client/handle-message"
title: "handle_message"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::client::Client::handle_message"
  parent: "signalwire::relay::client::Client"
  module: "relay.client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs"
  visibility: "public"
---
# `handle_message`

Parse a raw JSON string from the server and route it.

## Signature

```rust
fn handle_message(&self, raw: &str)
```

## Parameters

| Name  | Type   | Required | Default | Description |
| ----- | ------ | -------- | ------- | ----------- |
| `raw` | `&str` | yes      | —       | —           |

## Source

[`src/relay/client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs)

Line 498.
