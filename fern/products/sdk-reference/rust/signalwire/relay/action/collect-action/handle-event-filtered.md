---
slug: "/reference/rust/signalwire/relay/action/collect-action/handle-event-filtered"
title: "handle_event_filtered"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::relay::action::CollectAction::handle_event_filtered"
  parent: "signalwire::relay::action::CollectAction"
  module: "relay.action"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/action.rs"
  visibility: "public"
---
# `handle_event_filtered`

Handle an event, silently ignoring intermediate play events.

## Signature

```rust
fn handle_event_filtered(&self, event: &?)
```

## Parameters

| Name    | Type | Required | Default | Description |
| ------- | ---- | -------- | ------- | ----------- |
| `event` | `&?` | yes      | —       | —           |

## Source

[`src/relay/action.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/action.rs)

Line 357.
