---
slug: "/reference/rust/signalwire/swml/service/service/on-function-call"
title: "on_function_call"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swml::service::Service::on_function_call"
  parent: "signalwire::swml::service::Service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `on_function_call`

Dispatch a function call to the registered handler. Returns
`None` for unknown functions or registered functions with no
local handler (e.g. DataMap tools that execute server-side).

## Signature

```rust
fn on_function_call(
    &self,
    name: &str,
    args: &?<?, ?>,
    raw_data: &?<?, ?>
) -> ?<?>
```

## Parameters

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `name`     | `&str`     | yes      | —       | —           |
| `args`     | `&?<?, ?>` | yes      | —       | —           |
| `raw_data` | `&?<?, ?>` | yes      | —       | —           |

## Returns

`?<?>`

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 264.
