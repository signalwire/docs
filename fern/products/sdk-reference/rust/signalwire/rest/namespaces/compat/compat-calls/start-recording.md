---
slug: "/reference/rust/signalwire/rest/namespaces/compat/compat-calls/start-recording"
title: "start_recording"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::compat::CompatCalls::start_recording"
  parent: "signalwire::rest::namespaces::compat::CompatCalls"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/compat.rs"
  visibility: "public"
---
# `start_recording`

POST /Calls/{sid}/Recordings — start a new recording on the call.

## Signature

```rust
fn start_recording(&self, call_sid: &str, params: &?) -> ?<?, ?>
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

Line 183.
