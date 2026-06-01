---
slug: "/reference/rust/signalwire/swml/service/service/handle-request"
title: "handle_request"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swml::service::Service::handle_request"
  parent: "signalwire::swml::service::Service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `handle_request`

Handle an HTTP request. Returns (status\_code, headers, body).

## Signature

```rust
fn handle_request(
    &self,
    method: &str,
    path: &str,
    headers: &?<?, ?>,
    body: &str
) -> (u16, ?<?, ?>, ?)
```

## Parameters

| Name      | Type       | Required | Default | Description |
| --------- | ---------- | -------- | ------- | ----------- |
| `method`  | `&str`     | yes      | —       | —           |
| `path`    | `&str`     | yes      | —       | —           |
| `headers` | `&?<?, ?>` | yes      | —       | —           |
| `body`    | `&str`     | yes      | —       | —           |

## Returns

`(u16, ?<?, ?>, ?)`

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 458.
