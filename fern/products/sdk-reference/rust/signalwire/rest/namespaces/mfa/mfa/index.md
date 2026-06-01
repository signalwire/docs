---
slug: "/reference/rust/signalwire/rest/namespaces/mfa/mfa"
title: "Mfa"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::mfa::Mfa"
  parent: "signalwire::rest::namespaces::mfa"
  module: "rest.namespaces.mfa"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/mfa.rs"
  visibility: "public"
---
# `Mfa`

MFA (Multi-Factor Authentication) namespace.

Mirrors `signalwire.rest.namespaces.mfa.MfaResource` from the Python SDK.
Rooted at `/api/relay/rest/mfa` with `sms`, `call`, and `verify`
sub-paths.

## Signature

```rust
struct Mfa { /* fields */ }
```

## Methods

- [`base_path`](/reference/rust/signalwire/rest/namespaces/mfa/mfa/base-path)
- [`call`](/reference/rust/signalwire/rest/namespaces/mfa/mfa/call) — POST /api/relay/rest/mfa/call — deliver a one-time code via voice.
- [`new`](/reference/rust/signalwire/rest/namespaces/mfa/mfa/new)
- [`sms`](/reference/rust/signalwire/rest/namespaces/mfa/mfa/sms) — POST /api/relay/rest/mfa/sms — send a one-time code over SMS.
- [`verify`](/reference/rust/signalwire/rest/namespaces/mfa/mfa/verify) — POST /api/relay/rest/mfa/{request\_id}/verify — verify a code.

## Source

[`src/rest/namespaces/mfa.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/mfa.rs)

Line 11.
