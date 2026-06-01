---
slug: "/reference/rust/signalwire/swml/service/service/register-swaig-function"
title: "register_swaig_function"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swml::service::Service::register_swaig_function"
  parent: "signalwire::swml::service::Service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `register_swaig_function`

Register a raw SWAIG function definition (e.g. DataMap tools that
have no local handler).

## Signature

```rust
fn register_swaig_function(&mut self, func_def: ?) -> &mut Self
```

## Parameters

| Name       | Type | Required | Default | Description |
| ---------- | ---- | -------- | ------- | ----------- |
| `func_def` | `?`  | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 212.
