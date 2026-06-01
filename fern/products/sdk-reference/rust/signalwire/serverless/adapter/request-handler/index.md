---
slug: "/reference/rust/signalwire/serverless/adapter/request-handler"
title: "RequestHandler"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "interface"
  language: "rust"
  qualified_name: "signalwire::serverless::adapter::RequestHandler"
  parent: "signalwire::serverless::adapter"
  module: "serverless.adapter"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/serverless/adapter.rs"
  visibility: "public"
---
# `RequestHandler`

Trait that the agent/service must implement so the adapter can
forward requests to it.

## Signature

```rust
trait RequestHandler
```

## Methods

- [`handle_request`](/reference/rust/signalwire/serverless/adapter/request-handler/handle-request) — Handle an HTTP request, returning (status\_code, headers, body).

## Source

[`src/serverless/adapter.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/serverless/adapter.rs)

Line 28.
