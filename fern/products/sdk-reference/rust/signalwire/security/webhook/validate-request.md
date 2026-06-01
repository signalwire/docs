---
slug: "/reference/rust/signalwire/security/webhook/validate-request"
title: "validate_request"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "function"
  language: "rust"
  qualified_name: "signalwire::security::webhook::validate_request"
  parent: "signalwire::security::webhook"
  module: "security.webhook"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/security/webhook.rs"
  visibility: "public"
---
# `validate_request`

Legacy `@signalwire/compatibility-api` drop-in entry point.

If `params_or_raw_body` is \[`ParamsOrBody::Body`], delegates to
\[`validate_webhook_signature`] (Scheme A then Scheme B with parsed form).

If it's \[`ParamsOrBody::Params`], runs Scheme B directly with those
pre-parsed form params (plus URL port normalization).

`bodySHA256` verification is skipped in the `Params` variant — there
is no raw body to hash.

## Signature

```rust
fn validate_request(
    signing_key: &str,
    signature: &str,
    url: &str,
    params_or_raw_body: &?
) -> ?<bool, ?>
```

## Parameters

| Name                 | Type   | Required | Default | Description |
| -------------------- | ------ | -------- | ------- | ----------- |
| `signing_key`        | `&str` | yes      | —       | —           |
| `signature`          | `&str` | yes      | —       | —           |
| `url`                | `&str` | yes      | —       | —           |
| `params_or_raw_body` | `&?`   | yes      | —       | —           |

## Returns

`?<bool, ?>`

## Source

[`src/security/webhook.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/security/webhook.rs)

Line 389.
