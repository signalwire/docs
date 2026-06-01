---
slug: "/reference/rust/signalwire/swml/service/service-options"
title: "ServiceOptions"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::swml::service::ServiceOptions"
  parent: "signalwire::swml::service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `ServiceOptions`

Options for constructing a `Service`.

## Signature

```rust
struct ServiceOptions { /* fields */ }
```

## Properties

| Name                  | Type     | Required | Default | Description |
| --------------------- | -------- | -------- | ------- | ----------- |
| `basic_auth_password` | `?<?>`   | yes      | —       | —           |
| `basic_auth_user`     | `?<?>`   | yes      | —       | —           |
| `host`                | `?<?>`   | yes      | —       | —           |
| `name`                | `?`      | yes      | —       | —           |
| `port`                | `?<u16>` | yes      | —       | —           |
| `route`               | `?<?>`   | yes      | —       | —           |

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 26.
