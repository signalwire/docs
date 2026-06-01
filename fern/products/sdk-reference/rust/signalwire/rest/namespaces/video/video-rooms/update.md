---
slug: "/reference/rust/signalwire/rest/namespaces/video/video-rooms/update"
title: "update"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::rest::namespaces::video::VideoRooms::update"
  parent: "signalwire::rest::namespaces::video::VideoRooms"
  module: "rest.namespaces.video"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/video.rs"
  visibility: "public"
---
# `update`

VideoRooms uses PUT for update.

## Signature

```rust
fn update(&self, room_id: &str, params: &?) -> ?<?, ?>
```

## Parameters

| Name      | Type   | Required | Default | Description |
| --------- | ------ | -------- | ------- | ----------- |
| `room_id` | `&str` | yes      | —       | —           |
| `params`  | `&?`   | yes      | —       | —           |

## Returns

`?<?, ?>`

## Source

[`src/rest/namespaces/video.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/rest/namespaces/video.rs)

Line 124.
