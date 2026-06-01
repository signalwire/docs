---
slug: "/reference/rust/signalwire/relay/event/event/new"
title: "new"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::event::Event::new"
  parent: "signalwire::relay::event::Event"
  module: "relay.event"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/event.rs"
  visibility: "public"
---
# `new`

Create a new event.  If `timestamp` is `0.0`, the current time is used.

## Signature

```rust
fn new(event_type: &str, params: ?<?, ?>, timestamp: f64) -> Self
```

## Parameters

| Name         | Type      | Required | Default | Description |
| ------------ | --------- | -------- | ------- | ----------- |
| `event_type` | `&str`    | yes      | —       | —           |
| `params`     | `?<?, ?>` | yes      | —       | —           |
| `timestamp`  | `f64`     | yes      | —       | —           |

## Returns

`Self`

## Source

[`src/relay/event.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/event.rs)

Line 16.
