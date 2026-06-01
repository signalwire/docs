---
slug: "/reference/rust/signalwire/swml/service/service/has-function"
title: "has_function"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swml::service::Service::has_function"
  parent: "signalwire::swml::service::Service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `has_function`

Whether a SWAIG function with the given name is registered.
Python parity: `ToolRegistry.has_function`.

## Signature

```rust
fn has_function(&self, name: &str) -> bool
```

## Parameters

| Name   | Type   | Required | Default | Description |
| ------ | ------ | -------- | ------- | ----------- |
| `name` | `&str` | yes      | —       | —           |

## Returns

`bool`

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 233.
