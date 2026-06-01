---
slug: "/reference/rust/signalwire/swml/service/service/get-proxy-url-base"
title: "get_proxy_url_base"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swml::service::Service::get_proxy_url_base"
  parent: "signalwire::swml::service::Service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `get_proxy_url_base`

Detect or construct the proxy URL base from request headers.

## Signature

```rust
fn get_proxy_url_base(&self, headers: &?<?, ?>) -> ?
```

## Parameters

| Name      | Type       | Required | Default | Description |
| --------- | ---------- | -------- | ------- | ----------- |
| `headers` | `&?<?, ?>` | yes      | —       | —           |

## Returns

`?`

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 603.
