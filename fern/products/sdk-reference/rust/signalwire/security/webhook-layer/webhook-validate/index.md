---
slug: "/reference/rust/signalwire/security/webhook-layer/webhook-validate"
title: "WebhookValidate"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::security::webhook_layer::WebhookValidate"
  parent: "signalwire::security::webhook_layer"
  module: "security.webhook_layer"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/security/webhook_layer.rs"
  visibility: "public"
---
# `WebhookValidate`

Tower \[`Service`] produced by \[`WebhookLayer::layer`]. Buffers the
request body, validates the signature, and either forwards a
reconstructed request to the inner service or short-circuits with
a `403 Forbidden`.

## Signature

```rust
struct WebhookValidate { /* fields */ }
```

## Inheritance

**Implements:** `Clone`, [Service](/reference/rust/signalwire/security/webhook-layer/webhook-layer/service)

## Methods

- [`call`](/reference/rust/signalwire/security/webhook-layer/webhook-validate/call)
- [`clone`](/reference/rust/signalwire/security/webhook-layer/webhook-validate/clone)
- [`poll_ready`](/reference/rust/signalwire/security/webhook-layer/webhook-validate/poll-ready)

## Type Aliases

- [`Error`](/reference/rust/signalwire/security/webhook-layer/webhook-validate/error)
- [`Future`](/reference/rust/signalwire/security/webhook-layer/webhook-validate/future)
- [`Response`](/reference/rust/signalwire/security/webhook-layer/webhook-validate/response)

## Source

[`src/security/webhook_layer.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/security/webhook_layer.rs)

Line 103.
