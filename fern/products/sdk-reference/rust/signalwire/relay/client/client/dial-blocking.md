---
slug: "/reference/rust/signalwire/relay/client/client/dial-blocking"
title: "dial_blocking"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::client::Client::dial_blocking"
  parent: "signalwire::relay::client::Client"
  module: "relay.client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs"
  visibility: "public"
---
# `dial_blocking`

Initiate an outbound call using `calling.dial`.

Mirrors Python's `RelayClient.dial`. The dial response carries no
`call_id` — the actual call info arrives via subsequent
`calling.call.dial` events keyed by `tag`. This method waits for
that event up to `dial_timeout` and returns the resolved Call.

`devices` is the standard serial/parallel device matrix
(`[[device]]` for one parallel leg / serial = one inner list with
multiple devices).

## Signature

```rust
fn dial_blocking(
    &self,
    devices: ?,
    tag: ?<&str>,
    max_duration: ?<u32>,
    dial_timeout: ?
) -> ?<?<?>, ?>
```

## Parameters

| Name           | Type      | Required | Default | Description |
| -------------- | --------- | -------- | ------- | ----------- |
| `devices`      | `?`       | yes      | —       | —           |
| `tag`          | `?<&str>` | yes      | —       | —           |
| `max_duration` | `?<u32>`  | yes      | —       | —           |
| `dial_timeout` | `?`       | yes      | —       | —           |

## Returns

`?<?<?>, ?>`

## Source

[`src/relay/client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs)

Line 887.
