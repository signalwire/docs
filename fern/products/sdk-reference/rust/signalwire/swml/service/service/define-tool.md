---
slug: "/reference/rust/signalwire/swml/service/service/define-tool"
title: "define_tool"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swml::service::Service::define_tool"
  parent: "signalwire::swml::service::Service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `define_tool`

Define a SWAIG function the AI can call. Tool descriptions and
parameter descriptions are LLM-facing prompt engineering — see
PORTING\_GUIDE for guidance.

Same shape as `AgentBase::define_tool` — a tool registered here is
usable on both sidecar and agent paths because they share storage.

## Signature

```rust
fn define_tool(
    &mut self,
    name: &str,
    description: &str,
    parameters: ?,
    handler: ?,
    secure: bool
) -> &mut Self
```

## Parameters

| Name          | Type   | Required | Default | Description |
| ------------- | ------ | -------- | ------- | ----------- |
| `name`        | `&str` | yes      | —       | —           |
| `description` | `&str` | yes      | —       | —           |
| `parameters`  | `?`    | yes      | —       | —           |
| `handler`     | `?`    | yes      | —       | —           |
| `secure`      | `bool` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 180.
