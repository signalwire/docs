---
slug: "/reference/rust/signalwire/security/webhook"
title: "webhook"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "module"
  language: "rust"
  qualified_name: "signalwire::security::webhook"
  parent: "signalwire::security"
  module: "security"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/security/webhook.rs"
  visibility: "public"
---
# `webhook`

Webhook signature validation for SignalWire-signed HTTP requests.

Implements both schemes from `porting-sdk/webhooks.md`:

- **Scheme A** — RELAY/SWML/JSON: `lowercase_hex(HMAC-SHA1(key, url + raw_body))`
- **Scheme B** — Compat/cXML form: `base64(HMAC-SHA1(key, url + sortedFormParams))`
  with optional `bodySHA256` query-param fallback for JSON-on-compat-surface.

Public API mirrors Python's `signalwire.core.security.webhook_validator`:

- \[`validate_webhook_signature`] — combined validator (tries A, then B).
- \[`validate_request`] — legacy `@signalwire/compatibility-api` drop-in
  that accepts either a raw body string or pre-parsed form params.

All comparisons go through \[`subtle::ConstantTimeEq`] so the secret
is not leaked through repeated requests. Inputs are taken as
`&str` / borrowed strings — no allocation hidden behind the API.

```
use signalwire::security::webhook::validate_webhook_signature;

let key = "PSKtest1234567890abcdef";
let url = "https://example.ngrok.io/webhook";
let raw_body = r#"{"event":"call.state","params":{"call_id":"abc-123","state":"answered"}}"#;
let sig = "c3c08c1fefaf9ee198a100d5906765a6f394bf0f";
assert!(validate_webhook_signature(key, sig, url, raw_body).unwrap());
```

Copyright (c) 2025 SignalWire. Licensed under the MIT License.

## Examples

```rust
use signalwire::security::webhook::validate_webhook_signature;

let key = "PSKtest1234567890abcdef";
let url = "https://example.ngrok.io/webhook";
let raw_body = r#"{"event":"call.state","params":{"call_id":"abc-123","state":"answered"}}"#;
let sig = "c3c08c1fefaf9ee198a100d5906765a6f394bf0f";
assert!(validate_webhook_signature(key, sig, url, raw_body).unwrap());
```

## Functions

- [`validate_request`](/reference/rust/signalwire/security/webhook/validate-request) — Legacy `@signalwire/compatibility-api` drop-in entry point.
- [`validate_webhook_signature`](/reference/rust/signalwire/security/webhook/validate-webhook-signature) — Validate a SignalWire webhook signature against both schemes.

## Enums

- [`ParamsOrBody`](/reference/rust/signalwire/security/webhook/params-or-body) — Argument shape for \[`validate_request`]. Either a raw body string (which will run Scheme A first, then Scheme B with the form-parsed body) or a pre-parsed form-param list (which goes straight to Scheme B).
- [`WebhookError`](/reference/rust/signalwire/security/webhook/webhook-error) — Errors returned by the webhook validator.

## Source

[`src/security/webhook.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/security/webhook.rs)

Line 1.
