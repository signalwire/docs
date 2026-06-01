---
slug: "/reference/rust/signalwire/security/session-manager/session-manager"
title: "SessionManager"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::security::session_manager::SessionManager"
  parent: "signalwire::security::session_manager"
  module: "security.session_manager"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/security/session_manager.rs"
  visibility: "public"
---
# `SessionManager`

Session manager that generates and validates HMAC-signed tokens.

Tokens bind a function name and call ID together with an expiry time,
preventing replay attacks and cross-function/cross-call misuse.

## Signature

```rust
struct SessionManager { /* fields */ }
```

## Inheritance

**Implements:** `Clone`

## Methods

- [`clone`](/reference/rust/signalwire/security/session-manager/session-manager/clone)
- [`create_session`](/reference/rust/signalwire/security/session-manager/session-manager/create-session) — Create or confirm a session, returning the call ID.
- [`create_token`](/reference/rust/signalwire/security/session-manager/session-manager/create-token) — Generate an HMAC-SHA256 signed token for a given function and call.
- [`new`](/reference/rust/signalwire/security/session-manager/session-manager/new) — Create a new session manager with a random 32-byte secret.
- [`token_expiry_secs`](/reference/rust/signalwire/security/session-manager/session-manager/token-expiry-secs) — Get the configured token expiry in seconds.
- [`validate_token`](/reference/rust/signalwire/security/session-manager/session-manager/validate-token) — Validate a token against the expected function name and call ID.
- [`with_defaults`](/reference/rust/signalwire/security/session-manager/session-manager/with-defaults) — Create a new session manager with the default expiry (3600 seconds).

## Source

[`src/security/session_manager.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/security/session_manager.rs)

Line 14.
