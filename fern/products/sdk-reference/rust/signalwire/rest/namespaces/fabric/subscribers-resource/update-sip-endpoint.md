---
slug: "/reference/rust/signalwire/rest/namespaces/fabric/subscribers-resource/update-sip-endpoint"
title: "update_sip_endpoint"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::fabric::SubscribersResource::update_sip_endpoint"
  parent: "signalwire::rest::namespaces::fabric::SubscribersResource"
  module: "rest.namespaces.fabric"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/fabric.rs"
  visibility: "public"
---
# `update_sip_endpoint`

## Signature

```rust
fn update_sip_endpoint(
    &self,
    subscriber_id: &str,
    endpoint_id: &str,
    params: &?
) -> ?<?, ?>
```

## Parameters

| Name            | Type   | Required | Default | Description |
| --------------- | ------ | -------- | ------- | ----------- |
| `subscriber_id` | `&str` | yes      | —       | —           |
| `endpoint_id`   | `&str` | yes      | —       | —           |
| `params`        | `&?`   | yes      | —       | —           |

## Returns

`?<?, ?>`

## Source

[`src/rest/namespaces/fabric.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/fabric.rs)

Line 256.
