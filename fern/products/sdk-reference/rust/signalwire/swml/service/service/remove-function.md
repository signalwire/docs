---
slug: "/reference/rust/signalwire/swml/service/service/remove-function"
title: "remove_function"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swml::service::Service::remove_function"
  parent: "signalwire::swml::service::Service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `remove_function`

Remove a registered SWAIG function. Returns `true` when the
function was found and removed; `false` when it wasn't
registered. Python parity: `ToolRegistry.remove_function`.

## Signature

```rust
fn remove_function(&mut self, name: &str) -> bool
```

## Parameters

| Name   | Type   | Required | Default | Description |
| ------ | ------ | -------- | ------- | ----------- |
| `name` | `&str` | yes      | —       | —           |

## Returns

`bool`

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 252.
