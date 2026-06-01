---
slug: "/reference/rust/signalwire/security/webhook/validate-webhook-signature"
title: "validate_webhook_signature"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "function"
  language: "rust"
  qualified_name: "signalwire::security::webhook::validate_webhook_signature"
  parent: "signalwire::security::webhook"
  module: "security.webhook"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/security/webhook.rs"
  visibility: "public"
---
# `validate_webhook_signature`

Validate a SignalWire webhook signature against both schemes.

## Signature

```rust
fn validate_webhook_signature(
    signing_key: &str,
    signature: &str,
    url: &str,
    raw_body: &str
) -> ?<bool, ?>
```

## Parameters

| Name          | Type   | Required | Default | Description |
| ------------- | ------ | -------- | ------- | ----------- |
| `signing_key` | `&str` | yes      | —       | —           |
| `signature`   | `&str` | yes      | —       | —           |
| `url`         | `&str` | yes      | —       | —           |
| `raw_body`    | `&str` | yes      | —       | —           |

## Returns

`?<bool, ?>` — All comparisons are constant-time via \[`subtle::ConstantTimeEq`].

## Source

[`src/security/webhook.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/security/webhook.rs)

Line 325.
