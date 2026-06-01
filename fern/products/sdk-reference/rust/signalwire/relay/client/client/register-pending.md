---
slug: "/reference/rust/signalwire/relay/client/client/register-pending"
title: "register_pending"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::client::Client::register_pending"
  parent: "signalwire::relay::client::Client"
  module: "relay.client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs"
  visibility: "public"
---
# `register_pending`

Register a pending-response slot for a request ID.

## Signature

```rust
fn register_pending<R, E>(
    &self,
    id: &str,
    resolve: R,
    reject: E
) where R: ?(?) + ? + 'static, E: ?(?) + ? + 'static
```

## Type Parameters

| Name | Type | Required | Default | Description |
| ---- | ---- | -------- | ------- | ----------- |
| `R`  | —    | yes      | —       | —           |
| `E`  | —    | yes      | —       | —           |

## Parameters

| Name      | Type   | Required | Default | Description |
| --------- | ------ | -------- | ------- | ----------- |
| `id`      | `&str` | yes      | —       | —           |
| `resolve` | `R`    | yes      | —       | —           |
| `reject`  | `E`    | yes      | —       | —           |

## Source

[`src/relay/client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs)

Line 451.
