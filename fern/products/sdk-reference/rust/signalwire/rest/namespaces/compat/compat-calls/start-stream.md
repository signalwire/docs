---
slug: "/reference/rust/signalwire/rest/namespaces/compat/compat-calls/start-stream"
title: "start_stream"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::compat::CompatCalls::start_stream"
  parent: "signalwire::rest::namespaces::compat::CompatCalls"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/compat.rs"
  visibility: "public"
---
# `start_stream`

POST /Calls/{sid}/Streams — start a new stream on the call.

## Signature

```rust
fn start_stream(&self, call_sid: &str, params: &?) -> ?<?, ?>
```

## Parameters

| Name       | Type   | Required | Default | Description |
| ---------- | ------ | -------- | ------- | ----------- |
| `call_sid` | `&str` | yes      | —       | —           |
| `params`   | `&?`   | yes      | —       | —           |

## Returns

`?<?, ?>`

## Source

[`src/rest/namespaces/compat.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/compat.rs)

Line 204.
