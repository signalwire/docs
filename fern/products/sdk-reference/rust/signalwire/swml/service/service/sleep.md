---
slug: "/reference/rust/signalwire/swml/service/service/sleep"
title: "sleep"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swml::service::Service::sleep"
  parent: "signalwire::swml::service::Service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `sleep`

Add a `sleep` verb (integer milliseconds) to a section.

## Signature

```rust
fn sleep(&mut self, millis: i64, section: &str)
```

## Parameters

| Name      | Type   | Required | Default | Description |
| --------- | ------ | -------- | ------- | ----------- |
| `millis`  | `i64`  | yes      | —       | —           |
| `section` | `&str` | yes      | —       | —           |

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 448.
