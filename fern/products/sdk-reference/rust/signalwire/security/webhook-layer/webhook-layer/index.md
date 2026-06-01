---
slug: "/reference/rust/signalwire/security/webhook-layer/webhook-layer"
title: "WebhookLayer"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::security::webhook_layer::WebhookLayer"
  parent: "signalwire::security::webhook_layer"
  module: "security.webhook_layer"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/security/webhook_layer.rs"
  visibility: "public"
---
# `WebhookLayer`

Tower \[`Layer`] that wraps any `Service<Request<Body>>` with
SignalWire webhook signature validation.

Construct with \[`WebhookLayer::new`] and pass the customer's
Signing Key. Optionally provide an explicit URL via
\[`WebhookLayer::with_url_override`] when running behind a tunnel
or reverse proxy that doesn't set `X-Forwarded-*` headers.

## Signature

```rust
struct WebhookLayer { /* fields */ }
```

## Inheritance

**Implements:** `Clone`, `Layer`

## Methods

- [`clone`](/reference/rust/signalwire/security/webhook-layer/webhook-layer/clone)
- [`layer`](/reference/rust/signalwire/security/webhook-layer/webhook-layer/layer)
- [`new`](/reference/rust/signalwire/security/webhook-layer/webhook-layer/new) — Construct a new layer bound to the given Signing Key.
- [`with_url_base`](/reference/rust/signalwire/security/webhook-layer/webhook-layer/with-url-base) — Override the URL **base** the validator signs against. When set, reverse-proxy header reconstruction is skipped and the full URL is built as `<base><request_path_and_query>`.

## Type Aliases

- [`Service`](/reference/rust/signalwire/security/webhook-layer/webhook-layer/service)

## Source

[`src/security/webhook_layer.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/security/webhook_layer.rs)

Line 49.
