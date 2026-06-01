---
slug: "/reference/rust/signalwire/serverless/adapter/request-handler/handle-request"
title: "handle_request"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::serverless::adapter::RequestHandler::handle_request"
  parent: "signalwire::serverless::adapter::RequestHandler"
  module: "serverless.adapter"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/serverless/adapter.rs"
  visibility: "public"
---
# `handle_request`

Handle an HTTP request, returning (status\_code, headers, body).

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

[`src/serverless/adapter.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/serverless/adapter.rs)

Line 30.
