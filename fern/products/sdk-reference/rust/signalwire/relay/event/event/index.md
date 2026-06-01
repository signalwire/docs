---
slug: "/reference/rust/signalwire/relay/event/event"
title: "Event"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::relay::event::Event"
  parent: "signalwire::relay::event"
  module: "relay.event"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/event.rs"
  visibility: "public"
---
# `Event`

A RELAY event received from the SignalWire server.

Events carry an `event_type` (e.g. `"calling.call.state"`), a
timestamp, and a bag of string-keyed parameters.

## Signature

```rust
struct Event { /* fields */ }
```

## Inheritance

**Implements:** `Debug`, `Clone`

## Methods

- [`call_id`](/reference/rust/signalwire/relay/event/event/call-id)
- [`clone`](/reference/rust/signalwire/relay/event/event/clone)
- [`control_id`](/reference/rust/signalwire/relay/event/event/control-id)
- [`event_type`](/reference/rust/signalwire/relay/event/event/event-type)
- [`fmt`](/reference/rust/signalwire/relay/event/event/fmt)
- [`new`](/reference/rust/signalwire/relay/event/event/new) — Create a new event. If `timestamp` is `0.0`, the current time is used.
- [`node_id`](/reference/rust/signalwire/relay/event/event/node-id)
- [`params`](/reference/rust/signalwire/relay/event/event/params)
- [`parse`](/reference/rust/signalwire/relay/event/event/parse) — Convenience constructor from a `serde_json::Value` params object.
- [`state`](/reference/rust/signalwire/relay/event/event/state)
- [`tag`](/reference/rust/signalwire/relay/event/event/tag)
- [`timestamp`](/reference/rust/signalwire/relay/event/event/timestamp)
- [`to_value`](/reference/rust/signalwire/relay/event/event/to-value) — Serialize back to a JSON-compatible map.

## Source

[`src/relay/event.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/event.rs)

Line 8.
