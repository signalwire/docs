---
slug: "/reference/rust/signalwire/rest/namespaces/video/video-conference-tokens/reset"
title: "reset"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::video::VideoConferenceTokens::reset"
  parent: "signalwire::rest::namespaces::video::VideoConferenceTokens"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/video.rs"
  visibility: "public"
---
# `reset`

POST {base}/{id}/reset — no-body POST per Python.

## Signature

```rust
fn reset(&self, token_id: &str) -> ?<?, ?>
```

## Parameters

| Name       | Type   | Required | Default | Description |
| ---------- | ------ | -------- | ------- | ----------- |
| `token_id` | `&str` | yes      | —       | —           |

## Returns

`?<?, ?>`

## Source

[`src/rest/namespaces/video.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/video.rs)

Line 399.
