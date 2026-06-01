---
slug: "/reference/rust/signalwire/rest/error/signal-wire-rest-error/new"
title: "new"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::error::SignalWireRestError::new"
  parent: "signalwire::rest::error::SignalWireRestError"
  module: "rest.error"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/error.rs"
  visibility: "public"
---
# `new`

## Signature

```rust
fn new(message: &str, status_code: u16, response_body: &str) -> Self
```

## Parameters

| Name            | Type   | Required | Default | Description |
| --------------- | ------ | -------- | ------- | ----------- |
| `message`       | `&str` | yes      | —       | —           |
| `status_code`   | `u16`  | yes      | —       | —           |
| `response_body` | `&str` | yes      | —       | —           |

## Returns

`Self`

## Source

[`src/rest/error.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/error.rs)

Line 12.
