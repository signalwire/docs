---
slug: "/reference/rust/signalwire/security/session-manager/session-manager/create-token"
title: "create_token"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::security::session_manager::SessionManager::create_token"
  parent: "signalwire::security::session_manager::SessionManager"
  module: "security.session_manager"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/security/session_manager.rs"
  visibility: "public"
---
# `create_token`

Generate an HMAC-SHA256 signed token for a given function and call.

Token format (before base64url encoding):
`{call_id}.{function_name}.{expiry}.{nonce}.{hmac_hex}`

## Signature

```rust
fn create_token(&self, function_name: &str, call_id: &str) -> ?
```

## Parameters

| Name            | Type   | Required | Default | Description |
| --------------- | ------ | -------- | ------- | ----------- |
| `function_name` | `&str` | yes      | —       | —           |
| `call_id`       | `&str` | yes      | —       | —           |

## Returns

`?`

## Source

[`src/security/session_manager.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/security/session_manager.rs)

Line 52.
