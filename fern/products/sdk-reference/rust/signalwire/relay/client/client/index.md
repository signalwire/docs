---
slug: "/reference/rust/signalwire/relay/client/client"
title: "Client"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::relay::client::Client"
  parent: "signalwire::relay::client"
  module: "relay.client"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs"
  visibility: "public"
---
# `Client`

RELAY Client -- manages the WebSocket connection to SignalWire, sends
JSON-RPC requests, and dispatches inbound events to the correct Call
or Message objects.

The transport is a real WebSocket connection over TCP (plus TLS for
`wss://`). One reader thread (spawned on `connect()`) owns the read
half and dispatches every inbound JSON-RPC frame through
`handle_message`. Writes go through `send()` which serializes the
frame and pushes it onto an mpsc channel that the reader thread
drains alongside its read loop, so all socket I/O is single-
threaded but both directions make forward progress.

Tests still use `sent_messages` to inspect what the client _would_
have written; `send()` mirrors every frame into that Vec whether or
not a live socket is attached. That keeps the unit tests covering
dispatch logic working without a real RELAY server.

## Signature

```rust
struct Client { /* fields */ }
```

## Properties

| Name                  | Type            | Required | Default | Description                                        |
| --------------------- | --------------- | -------- | ------- | -------------------------------------------------- |
| `agent`               | `?`             | yes      | —       | —                                                  |
| `authorization_state` | `?<?<?>>`       | yes      | —       | —                                                  |
| `calls`               | `?<?<?, ?<?>>>` | yes      | —       | —                                                  |
| `connected`           | `?<bool>`       | yes      | —       | —                                                  |
| `contexts`            | `?<?<?>>`       | yes      | —       | —                                                  |
| `host`                | `?`             | yes      | —       | —                                                  |
| `messages`            | `?<?<?, ?<?>>>` | yes      | —       | —                                                  |
| `project`             | `?`             | yes      | —       | —                                                  |
| `protocol`            | `?<?<?>>`       | yes      | —       | —                                                  |
| `sent_messages`       | `?<?<?>>`       | yes      | —       | Messages sent through the transport (for testing). |
| `session_id`          | `?<?<?>>`       | yes      | —       | —                                                  |
| `token`               | `?`             | yes      | —       | —                                                  |

## Methods

- [`authenticate`](/reference/rust/signalwire/relay/client/client/authenticate) — Backwards-compat: enqueue the `signalwire.connect` frame without waiting. Used by older tests that drive `handle_message` directly. Production code should call \[`connect`] which runs the full handshake.
- [`authenticate_blocking`](/reference/rust/signalwire/relay/client/client/authenticate-blocking) — Send the `signalwire.connect` RPC and block until the response arrives or the handshake times out. The response carries the server-assigned protocol string and authorization state.
- [`bump_reconnect_delay`](/reference/rust/signalwire/relay/client/client/bump-reconnect-delay) — Compute the next reconnect delay (1s → 2s → 4s → … → 30s) and return the value to wait _this_ time. Mirrors Python's `RECONNECT_MIN_DELAY` / `RECONNECT_MAX_DELAY` / backoff factor. Exposed (and tested) separately from \[`reconnect`] so the math is verifiable without opening a real socket.
- [`connect`](/reference/rust/signalwire/relay/client/client/connect) — Open the WebSocket connection, run the `signalwire.connect` handshake, subscribe to the configured contexts, and spawn the reader thread that dispatches every inbound frame through `handle_message`.
- [`connect_fresh`](/reference/rust/signalwire/relay/client/client/connect-fresh) — Initial connect -- resets reconnect delay and connects.
- [`dial_blocking`](/reference/rust/signalwire/relay/client/client/dial-blocking) — Initiate an outbound call using `calling.dial`.
- [`disconnect`](/reference/rust/signalwire/relay/client/client/disconnect) — Gracefully close the connection. Signals the reader thread to exit, sends a WS close frame, and joins the thread.
- [`execute_blocking`](/reference/rust/signalwire/relay/client/client/execute-blocking) — Send a JSON-RPC request for a calling/messaging method.
- [`from_env`](/reference/rust/signalwire/relay/client/client/from-env) — Create from env vars SIGNALWIRE\_PROJECT\_ID, SIGNALWIRE\_API\_TOKEN, SIGNALWIRE\_SPACE.
- [`get_call`](/reference/rust/signalwire/relay/client/client/get-call) — Get a call by ID.
- [`get_message`](/reference/rust/signalwire/relay/client/client/get-message) — Get a message by ID.
- [`handle_event`](/reference/rust/signalwire/relay/client/client/handle-event) — Route a signalwire.event payload to the appropriate handler.
- [`handle_message`](/reference/rust/signalwire/relay/client/client/handle-message) — Parse a raw JSON string from the server and route it.
- [`is_connected`](/reference/rust/signalwire/relay/client/client/is-connected)
- [`is_running`](/reference/rust/signalwire/relay/client/client/is-running)
- [`new`](/reference/rust/signalwire/relay/client/client/new)
- [`on_call`](/reference/rust/signalwire/relay/client/client/on-call) — Register a handler for inbound calls.
- [`on_event`](/reference/rust/signalwire/relay/client/client/on-event) — Register a generic event handler.
- [`on_message`](/reference/rust/signalwire/relay/client/client/on-message) — Register a handler for inbound messages.
- [`receive`](/reference/rust/signalwire/relay/client/client/receive) — Subscribe to one or more inbound contexts.
- [`reconnect`](/reference/rust/signalwire/relay/client/client/reconnect) — Reconnect with exponential back-off (1s → 30s cap). Sleeps for the current delay, doubles the delay (capped at 30s), and runs the full connect handshake again. Authorization state survives across reconnects because \[`authenticate_blocking`] re-sends the stored token on the new socket.
- [`register_dial`](/reference/rust/signalwire/relay/client/client/register-dial) — Register a pending dial.
- [`register_pending`](/reference/rust/signalwire/relay/client/client/register-pending) — Register a pending-response slot for a request ID.
- [`remove_pending_dial`](/reference/rust/signalwire/relay/client/client/remove-pending-dial) — Remove a pending dial.
- [`send`](/reference/rust/signalwire/relay/client/client/send) — Send a raw JSON message through the transport.
- [`send_ack`](/reference/rust/signalwire/relay/client/client/send-ack) — Send an acknowledgement for a server-initiated request.
- [`send_message_blocking`](/reference/rust/signalwire/relay/client/client/send-message-blocking) — Send an outbound SMS/MMS message.
- [`send_request`](/reference/rust/signalwire/relay/client/client/send-request) — Build and send a JSON-RPC request. Returns the message ID.
- [`track_message`](/reference/rust/signalwire/relay/client/client/track-message) — Track a new message.
- [`unreceive`](/reference/rust/signalwire/relay/client/client/unreceive) — Unsubscribe from one or more contexts.

## Source

[`src/relay/client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs)

Line 76.
