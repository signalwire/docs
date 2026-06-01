---
slug: "/reference/rust/signalwire/rest/namespaces/sip-profile/sip-profile"
title: "SipProfile"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::sip_profile::SipProfile"
  parent: "signalwire::rest::namespaces::sip_profile"
  module: "rest.namespaces.sip_profile"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/sip_profile.rs"
  visibility: "public"
---
# `SipProfile`

SIP Profile (singleton resource) namespace.

Mirrors `signalwire.rest.namespaces.sip_profile.SipProfileResource`.
Rooted at `/api/relay/rest/sip_profile` (singular) — the project has
exactly one SIP profile, so there is no list/create/delete.

## Signature

```rust
struct SipProfile { /* fields */ }
```

## Methods

- [`base_path`](/reference/rust/signalwire/rest/namespaces/sip-profile/sip-profile/base-path)
- [`get`](/reference/rust/signalwire/rest/namespaces/sip-profile/sip-profile/get) — GET /api/relay/rest/sip\_profile — fetch the current profile.
- [`new`](/reference/rust/signalwire/rest/namespaces/sip-profile/sip-profile/new)
- [`update`](/reference/rust/signalwire/rest/namespaces/sip-profile/sip-profile/update) — PUT /api/relay/rest/sip\_profile — update the SIP profile.

## Source

[`src/rest/namespaces/sip_profile.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/sip_profile.rs)

Line 11.
