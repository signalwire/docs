---
slug: "/reference/rust/signalwire/swml/service/service/get-basic-auth-credentials-with-source"
title: "get_basic_auth_credentials_with_source"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swml::service::Service::get_basic_auth_credentials_with_source"
  parent: "signalwire::swml::service::Service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `get_basic_auth_credentials_with_source`

Get (user, password, source) where source is one of "provided",
"environment", or "generated". Python parity:
`AuthMixin.get_basic_auth_credentials(include_source=True)`.

## Signature

```rust
fn get_basic_auth_credentials_with_source(&self) -> (?, ?, ?)
```

## Returns

`(?, ?, ?)`

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 342.
