---
slug: "/reference/rust/signalwire/swml/service/service/set-on-swml-request-hook"
title: "set_on_swml_request_hook"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swml::service::Service::set_on_swml_request_hook"
  parent: "signalwire::swml::service::Service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `set_on_swml_request_hook`

Register a function that customizes the SWML response on a
per-request basis. The hook receives the parsed body and the
callback path; returning `Some(value)` applies modifications,
`None` falls through to the default rendering.

Rust has no method overriding via inheritance — this hook is
the idiomatic Rust equivalent of Python's overridable
`on_swml_request`.

## Signature

```rust
fn set_on_swml_request_hook<F>(
    &mut self,
    hook: F
) -> &mut Self where F: ?(?<&?>, ?<&str>) -> ?<?> + ? + ? + 'static
```

## Type Parameters

| Name | Type | Required | Default | Description |
| ---- | ---- | -------- | ------- | ----------- |
| `F`  | —    | yes      | —       | —           |

## Parameters

| Name   | Type | Required | Default | Description |
| ------ | ---- | -------- | ------- | ----------- |
| `hook` | `F`  | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 386.
