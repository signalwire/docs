---
slug: "/reference/rust/signalwire/swml/service/service/validate-basic-auth"
title: "validate_basic_auth"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swml::service::Service::validate_basic_auth"
  parent: "signalwire::swml::service::Service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `validate_basic_auth`

Validate provided basic-auth credentials against the configured ones.
Python parity: `AuthMixin.validate_basic_auth(username, password)`.

## Signature

```rust
fn validate_basic_auth(&self, username: &str, password: &str) -> bool
```

## Parameters

| Name       | Type   | Required | Default | Description |
| ---------- | ------ | -------- | ------- | ----------- |
| `username` | `&str` | yes      | —       | —           |
| `password` | `&str` | yes      | —       | —           |

## Returns

`bool`

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 361.
