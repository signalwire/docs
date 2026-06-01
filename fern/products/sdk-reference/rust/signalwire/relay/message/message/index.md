---
slug: "/reference/rust/signalwire/relay/message/message"
title: "Message"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::relay::message::Message"
  parent: "signalwire::relay::message"
  module: "relay.message"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/message.rs"
  visibility: "public"
---
# `Message`

Represents a RELAY messaging message (SMS / MMS).

A Message is created when you send or receive a message through the
RELAY messaging namespace.  It accumulates state-change events and
resolves once the message reaches a terminal state (delivered,
undelivered, or failed).

## Signature

```rust
struct Message { /* fields */ }
```

## Methods

- [`body`](/reference/rust/signalwire/relay/message/message/body)
- [`context`](/reference/rust/signalwire/relay/message/message/context)
- [`direction`](/reference/rust/signalwire/relay/message/message/direction)
- [`dispatch_event`](/reference/rust/signalwire/relay/message/message/dispatch-event) — Process an inbound event for this message.
- [`from_number`](/reference/rust/signalwire/relay/message/message/from-number)
- [`is_done`](/reference/rust/signalwire/relay/message/message/is-done)
- [`media`](/reference/rust/signalwire/relay/message/message/media)
- [`message_id`](/reference/rust/signalwire/relay/message/message/message-id)
- [`new`](/reference/rust/signalwire/relay/message/message/new) — Build a Message from a params map.
- [`on`](/reference/rust/signalwire/relay/message/message/on) — Register a listener that fires on every state-change event.
- [`on_completed`](/reference/rust/signalwire/relay/message/message/on-completed) — Register a callback to fire when the message reaches a terminal state.
- [`reason`](/reference/rust/signalwire/relay/message/message/reason)
- [`repr`](/reference/rust/signalwire/relay/message/message/repr) — Python-style `__repr__` (mirrors `Message.__repr__` in the signalwire-python reference). Returns a string of the form `Message(message_id=..., from=..., to=..., state=...)`.
- [`resolve`](/reference/rust/signalwire/relay/message/message/resolve) — Mark this message as completed.
- [`result`](/reference/rust/signalwire/relay/message/message/result)
- [`state`](/reference/rust/signalwire/relay/message/message/state)
- [`tags`](/reference/rust/signalwire/relay/message/message/tags)
- [`to_number`](/reference/rust/signalwire/relay/message/message/to-number)

## Source

[`src/relay/message.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/message.rs)

Line 17.
