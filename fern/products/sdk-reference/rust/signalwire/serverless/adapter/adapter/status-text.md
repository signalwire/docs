---
slug: "/reference/rust/signalwire/serverless/adapter/adapter/status-text"
title: "status_text"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::serverless::adapter::Adapter::status_text"
  parent: "signalwire::serverless::adapter::Adapter"
  module: "serverless.adapter"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/serverless/adapter.rs"
  visibility: "public"
---
# `status_text`

Return the standard HTTP status text for a given status code.

## Signature

```rust
fn status_text(code: u16) -> &'static str
```

## Parameters

| Name   | Type  | Required | Default | Description |
| ------ | ----- | -------- | ------- | ----------- |
| `code` | `u16` | yes      | —       | —           |

## Returns

`&'static str`

## Source

[`src/serverless/adapter.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/serverless/adapter.rs)

Line 200.
