---
slug: "/reference/rust/signalwire/rest/namespaces/compat/compat-calls/update-recording"
title: "update_recording"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::compat::CompatCalls::update_recording"
  parent: "signalwire::rest::namespaces::compat::CompatCalls"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/compat.rs"
  visibility: "public"
---
# `update_recording`

POST /Calls/{sid}/Recordings/{rec\_sid} — update a specific recording.

## Signature

```rust
fn update_recording(
    &self,
    call_sid: &str,
    recording_sid: &str,
    params: &?
) -> ?<?, ?>
```

## Parameters

| Name            | Type   | Required | Default | Description |
| --------------- | ------ | -------- | ------- | ----------- |
| `call_sid`      | `&str` | yes      | —       | —           |
| `recording_sid` | `&str` | yes      | —       | —           |
| `params`        | `&?`   | yes      | —       | —           |

## Returns

`?<?, ?>`

## Source

[`src/rest/namespaces/compat.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/compat.rs)

Line 193.
