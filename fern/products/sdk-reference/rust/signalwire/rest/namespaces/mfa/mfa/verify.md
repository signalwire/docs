---
slug: "/reference/rust/signalwire/rest/namespaces/mfa/mfa/verify"
title: "verify"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::mfa::Mfa::verify"
  parent: "signalwire::rest::namespaces::mfa::Mfa"
  module: "rest.namespaces.mfa"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/mfa.rs"
  visibility: "public"
---
# `verify`

POST /api/relay/rest/mfa/{request\_id}/verify — verify a code.

## Signature

```rust
fn verify(&self, request_id: &str, params: &?) -> ?<?, ?>
```

## Parameters

| Name         | Type   | Required | Default | Description |
| ------------ | ------ | -------- | ------- | ----------- |
| `request_id` | `&str` | yes      | —       | —           |
| `params`     | `&?`   | yes      | —       | —           |

## Returns

`?<?, ?>`

## Source

[`src/rest/namespaces/mfa.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/mfa.rs)

Line 39.
