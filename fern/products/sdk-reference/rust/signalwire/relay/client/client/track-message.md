---
slug: "/reference/rust/signalwire/relay/client/client/track-message"
title: "track_message"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::client::Client::track_message"
  parent: "signalwire::relay::client::Client"
  module: "relay.client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs"
  visibility: "public"
---
# `track_message`

Track a new message.

## Signature

```rust
fn track_message(&self, message_id: &str, msg: ?<?>)
```

## Parameters

| Name         | Type   | Required | Default | Description |
| ------------ | ------ | -------- | ------- | ----------- |
| `message_id` | `&str` | yes      | —       | —           |
| `msg`        | `?<?>` | yes      | —       | —           |

## Source

[`src/relay/client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs)

Line 707.
