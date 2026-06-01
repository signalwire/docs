---
slug: "/reference/rust/signalwire/serverless/adapter/adapter"
title: "Adapter"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::serverless::adapter::Adapter"
  parent: "signalwire::serverless::adapter"
  module: "serverless.adapter"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/serverless/adapter.rs"
  visibility: "public"
---
# `Adapter`

Auto-detect and handle serverless environments (Lambda, Azure, GCF, CGI)
or fall back to the built-in server.

## Signature

```rust
struct Adapter;
```

## Methods

- [`detect`](/reference/rust/signalwire/serverless/adapter/adapter/detect) — Detect the current runtime environment.
- [`handle_azure`](/reference/rust/signalwire/serverless/adapter/adapter/handle-azure) — Handle an Azure Functions invocation.
- [`handle_lambda`](/reference/rust/signalwire/serverless/adapter/adapter/handle-lambda) — Handle an AWS Lambda (API Gateway) invocation.
- [`serve_detect`](/reference/rust/signalwire/serverless/adapter/adapter/serve-detect) — Auto-detect the runtime environment and return the environment type. The caller can then dispatch accordingly.
- [`status_text`](/reference/rust/signalwire/serverless/adapter/adapter/status-text) — Return the standard HTTP status text for a given status code.

## Source

[`src/serverless/adapter.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/serverless/adapter.rs)

Line 41.
