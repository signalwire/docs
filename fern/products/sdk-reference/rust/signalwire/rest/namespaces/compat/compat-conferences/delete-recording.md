---
slug: "/reference/rust/signalwire/rest/namespaces/compat/compat-conferences/delete-recording"
title: "delete_recording"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::compat::CompatConferences::delete_recording"
  parent: "signalwire::rest::namespaces::compat::CompatConferences"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/compat.rs"
  visibility: "public"
---
# `delete_recording`

## Signature

```rust
fn delete_recording(&self, conference_sid: &str, recording_sid: &str) -> ?<?, ?>
```

## Parameters

| Name             | Type   | Required | Default | Description |
| ---------------- | ------ | -------- | ------- | ----------- |
| `conference_sid` | `&str` | yes      | —       | —           |
| `recording_sid`  | `&str` | yes      | —       | —           |

## Returns

`?<?, ?>`

## Source

[`src/rest/namespaces/compat.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/compat.rs)

Line 464.
