---
slug: "/reference/rust/signalwire/rest/namespaces/compat/compat-conferences/remove-participant"
title: "remove_participant"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::compat::CompatConferences::remove_participant"
  parent: "signalwire::rest::namespaces::compat::CompatConferences"
  module: "rest.namespaces.compat"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/compat.rs"
  visibility: "public"
---
# `remove_participant`

## Signature

```rust
fn remove_participant(&self, conference_sid: &str, call_sid: &str) -> ?<?, ?>
```

## Parameters

| Name             | Type   | Required | Default | Description |
| ---------------- | ------ | -------- | ------- | ----------- |
| `conference_sid` | `&str` | yes      | —       | —           |
| `call_sid`       | `&str` | yes      | —       | —           |

## Returns

`?<?, ?>`

## Source

[`src/rest/namespaces/compat.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/compat.rs)

Line 426.
