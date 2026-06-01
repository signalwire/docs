---
slug: "/reference/rust/signalwire/serverless/adapter/adapter/handle-lambda"
title: "handle_lambda"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::serverless::adapter::Adapter::handle_lambda"
  parent: "signalwire::serverless::adapter::Adapter"
  module: "serverless.adapter"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/serverless/adapter.rs"
  visibility: "public"
---
# `handle_lambda`

Handle an AWS Lambda (API Gateway) invocation.

Extracts method, path, headers, and body from the API Gateway event
format, calls agent.handle\_request(), and returns an API Gateway
compatible response.

## Signature

```rust
fn handle_lambda(agent: &dyn ?, event: &?) -> ?
```

## Parameters

| Name    | Type     | Required | Default | Description |
| ------- | -------- | -------- | ------- | ----------- |
| `agent` | `&dyn ?` | yes      | —       | —           |
| `event` | `&?`     | yes      | —       | —           |

## Returns

`?`

## Source

[`src/serverless/adapter.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/serverless/adapter.rs)

Line 67.
