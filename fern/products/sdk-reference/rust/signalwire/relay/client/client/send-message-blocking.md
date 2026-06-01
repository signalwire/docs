---
slug: "/reference/rust/signalwire/relay/client/client/send-message-blocking"
title: "send_message_blocking"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::client::Client::send_message_blocking"
  parent: "signalwire::relay::client::Client"
  module: "relay.client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs"
  visibility: "public"
---
# `send_message_blocking`

Send an outbound SMS/MMS message.

Mirrors Python's `RelayClient.send_message`. At least one of
`body` or `media` must be supplied. Returns a tracked `Message`
whose state will progress as `messaging.state` events arrive
from the server.

## Signature

```rust
fn send_message_blocking(
    &self,
    to_number: &str,
    from_number: &str,
    body: ?<&str>,
    media: ?<&[?]>,
    tags: ?<&[?]>,
    context: ?<&str>
) -> ?<?<?>, ?>
```

## Parameters

| Name          | Type      | Required | Default | Description |
| ------------- | --------- | -------- | ------- | ----------- |
| `to_number`   | `&str`    | yes      | —       | —           |
| `from_number` | `&str`    | yes      | —       | —           |
| `body`        | `?<&str>` | yes      | —       | —           |
| `media`       | `?<&[?]>` | yes      | —       | —           |
| `tags`        | `?<&[?]>` | yes      | —       | —           |
| `context`     | `?<&str>` | yes      | —       | —           |

## Returns

`?<?<?>, ?>`

## Source

[`src/relay/client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs)

Line 802.
