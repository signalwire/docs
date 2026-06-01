---
slug: "/reference/rust/signalwire/relay/action/action"
title: "Action"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::relay::action::Action"
  parent: "signalwire::relay::action"
  module: "relay.action"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/action.rs"
  visibility: "public"
---
# `Action`

Base class for all RELAY call actions (play, record, collect, etc.).

An Action is the client-side handle returned when you start an
asynchronous operation on a call.  It accumulates events, tracks
state, and resolves once the operation reaches a terminal state.

## Signature

```rust
struct Action { /* fields */ }
```

## Methods

- [`call_id`](/reference/rust/signalwire/relay/action/action/call-id)
- [`control_id`](/reference/rust/signalwire/relay/action/action/control-id)
- [`events`](/reference/rust/signalwire/relay/action/action/events)
- [`execute_subcommand`](/reference/rust/signalwire/relay/action/action/execute-subcommand) — Send a sub-command RPC through the client.
- [`handle_event`](/reference/rust/signalwire/relay/action/action/handle-event) — Append an incoming event and update local state / payload. Subclasses override `should_handle_event` to filter.
- [`is_done`](/reference/rust/signalwire/relay/action/action/is-done)
- [`new`](/reference/rust/signalwire/relay/action/action/new)
- [`node_id`](/reference/rust/signalwire/relay/action/action/node-id)
- [`on_completed`](/reference/rust/signalwire/relay/action/action/on-completed) — Register a callback to fire when the action completes. If the action is already done, the callback fires immediately.
- [`payload`](/reference/rust/signalwire/relay/action/action/payload)
- [`resolve`](/reference/rust/signalwire/relay/action/action/resolve) — Mark this action as completed.
- [`result`](/reference/rust/signalwire/relay/action/action/result)
- [`set_notify_sender`](/reference/rust/signalwire/relay/action/action/set-notify-sender) — Install a channel sender so that `wait_sync()` can block until the action resolves.
- [`state`](/reference/rust/signalwire/relay/action/action/state)
- [`stop`](/reference/rust/signalwire/relay/action/action/stop) — Stop the running action by sending its stop sub-command.
- [`stop_method`](/reference/rust/signalwire/relay/action/action/stop-method)
- [`with_stop_method`](/reference/rust/signalwire/relay/action/action/with-stop-method)

## Source

[`src/relay/action.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/action.rs)

Line 20.
