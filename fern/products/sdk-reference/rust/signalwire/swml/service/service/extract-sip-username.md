---
slug: "/reference/rust/signalwire/swml/service/service/extract-sip-username"
title: "extract_sip_username"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swml::service::Service::extract_sip_username"
  parent: "signalwire::swml::service::Service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `extract_sip_username`

Extract SIP username from a request body.
Validates format: only `[a-zA-Z0-9._-]`, max 64 chars.

## Signature

```rust
fn extract_sip_username(body: &?) -> ?<?>
```

## Parameters

| Name   | Type | Required | Default | Description |
| ------ | ---- | -------- | ------- | ----------- |
| `body` | `&?` | yes      | —       | —           |

## Returns

`?<?>`

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 558.
