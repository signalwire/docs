---
slug: "/reference/rust/signalwire/security/session-manager/session-manager/validate-token"
title: "validate_token"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::security::session_manager::SessionManager::validate_token"
  parent: "signalwire::security::session_manager::SessionManager"
  module: "security.session_manager"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/security/session_manager.rs"
  visibility: "public"
---
# `validate_token`

Validate a token against the expected function name and call ID.

Uses timing-safe comparison for all security-critical fields.

## Signature

```rust
fn validate_token(
    &self,
    function_name: &str,
    call_id: &str,
    token: &str
) -> bool
```

## Parameters

| Name            | Type   | Required | Default | Description |
| --------------- | ------ | -------- | ------- | ----------- |
| `function_name` | `&str` | yes      | —       | —           |
| `call_id`       | `&str` | yes      | —       | —           |
| `token`         | `&str` | yes      | —       | —           |

## Returns

`bool`

## Source

[`src/security/session_manager.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/security/session_manager.rs)

Line 70.
