---
slug: "/reference/rust/signalwire/security/session-manager/session-manager/new"
title: "new"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::security::session_manager::SessionManager::new"
  parent: "signalwire::security::session_manager::SessionManager"
  module: "security.session_manager"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/security/session_manager.rs"
  visibility: "public"
---
# `new`

Create a new session manager with a random 32-byte secret.

## Signature

```rust
fn new(token_expiry_secs: u64) -> Self
```

## Parameters

| Name                | Type  | Required | Default | Description |
| ------------------- | ----- | -------- | ------- | ----------- |
| `token_expiry_secs` | `u64` | yes      | —       | —           |

## Returns

`Self`

## Source

[`src/security/session_manager.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/security/session_manager.rs)

Line 21.
