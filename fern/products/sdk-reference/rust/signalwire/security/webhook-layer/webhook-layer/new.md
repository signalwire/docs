---
slug: "/reference/rust/signalwire/security/webhook-layer/webhook-layer/new"
title: "new"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::security::webhook_layer::WebhookLayer::new"
  parent: "signalwire::security::webhook_layer::WebhookLayer"
  module: "security.webhook_layer"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/security/webhook_layer.rs"
  visibility: "public"
---
# `new`

Construct a new layer bound to the given Signing Key.

## Signature

```rust
fn new<impl Into<String>: ?<?>>(signing_key: impl ?<?>) -> Self
```

## Type Parameters

| Name                | Type   | Required | Default | Description |
| ------------------- | ------ | -------- | ------- | ----------- |
| `impl Into<String>` | `?<?>` | yes      | —       | —           |

## Parameters

| Name          | Type        | Required | Default | Description |
| ------------- | ----------- | -------- | ------- | ----------- |
| `signing_key` | `impl ?<?>` | yes      | —       | —           |

## Returns

`Self`

## Source

[`src/security/webhook_layer.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/security/webhook_layer.rs)

Line 60.
