---
slug: "/reference/rust/signalwire/relay/action/collect-action"
title: "CollectAction"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::relay::action::CollectAction"
  parent: "signalwire::relay::action"
  module: "relay.action"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/action.rs"
  visibility: "public"
---
# `CollectAction`

## Signature

```rust
struct CollectAction { /* fields */ }
```

## Inheritance

**Implements:** `Deref`

## Properties

| Name    | Type   | Required | Default | Description |
| ------- | ------ | -------- | ------- | ----------- |
| `inner` | `?<?>` | yes      | —       | —           |

## Methods

- [`action`](/reference/rust/signalwire/relay/action/collect-action/action)
- [`collect_result`](/reference/rust/signalwire/relay/action/collect-action/collect-result)
- [`deref`](/reference/rust/signalwire/relay/action/collect-action/deref)
- [`handle_event_filtered`](/reference/rust/signalwire/relay/action/collect-action/handle-event-filtered) — Handle an event, silently ignoring intermediate play events.
- [`new`](/reference/rust/signalwire/relay/action/collect-action/new)
- [`start_input_timers`](/reference/rust/signalwire/relay/action/collect-action/start-input-timers)

## Type Aliases

- [`Target`](/reference/rust/signalwire/relay/action/collect-action/target)

## Source

[`src/relay/action.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/action.rs)

Line 328.
