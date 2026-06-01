---
slug: "/reference/rust/signalwire/security/webhook/params-or-body"
title: "ParamsOrBody"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "enum"
  language: "rust"
  qualified_name: "signalwire::security::webhook::ParamsOrBody"
  parent: "signalwire::security::webhook"
  module: "security.webhook"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/security/webhook.rs"
  visibility: "public"
---
# `ParamsOrBody`

Argument shape for \[`validate_request`]. Either a raw body string
(which will run Scheme A first, then Scheme B with the form-parsed
body) or a pre-parsed form-param list (which goes straight to
Scheme B).

Repeated keys in the `Params` variant are supported by emitting a
`Vec<String>` per key in submission order.

## Signature

```rust
enum ParamsOrBody
```

## Inheritance

**Implements:** `Debug`, `Clone`

## Variants

| Name     | Type        | Required | Default | Description                                                                                                                                                          |
| -------- | ----------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Body`   | `Body(_)`   | yes      | —       | Raw HTTP request body (UTF-8). The validator will sort form params if it parses cleanly; for JSON bodies this branch degrades to the empty-params Scheme B fallback. |
| `Params` | `Params(_)` | yes      | —       | Pre-parsed form params, list-of-(key, list-of-values) so repeated keys keep their submission order.                                                                  |

## Methods

- [`clone`](/reference/rust/signalwire/security/webhook/params-or-body/clone)
- [`fmt`](/reference/rust/signalwire/security/webhook/params-or-body/fmt)

## Source

[`src/security/webhook.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/security/webhook.rs)

Line 75.
