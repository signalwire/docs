---
slug: "/reference/rust/signalwire/rest/namespaces/fabric/subscribers-resource/delete-sip-endpoint"
title: "delete_sip_endpoint"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::fabric::SubscribersResource::delete_sip_endpoint"
  parent: "signalwire::rest::namespaces::fabric::SubscribersResource"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/fabric.rs"
  visibility: "public"
---
# `delete_sip_endpoint`

## Signature

```rust
fn delete_sip_endpoint(&self, subscriber_id: &str, endpoint_id: &str) -> ?<?, ?>
```

## Parameters

| Name            | Type   | Required | Default | Description |
| --------------- | ------ | -------- | ------- | ----------- |
| `subscriber_id` | `&str` | yes      | —       | —           |
| `endpoint_id`   | `&str` | yes      | —       | —           |

## Returns

`?<?, ?>`

## Source

[`src/rest/namespaces/fabric.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/fabric.rs)

Line 266.
