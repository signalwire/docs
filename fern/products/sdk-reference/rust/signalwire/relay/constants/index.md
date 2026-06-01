---
slug: "/reference/rust/signalwire/relay/constants"
title: "constants"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "module"
  language: "rust"
  qualified_name: "signalwire::relay::constants"
  parent: "signalwire::relay"
  module: "relay"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/constants.rs"
  visibility: "public"
---
# `constants`

RELAY module -- real-time event signalling over WebSocket (JSON-RPC 2.0).

Provides constants, event/action primitives, call control, message
tracking, and the async-ready `Client` that ties everything together.

## Constants

| Name                        | Type                                    | Required | Default | Description                                                                                                                                                                                                                      |
| --------------------------- | --------------------------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CALL_STATE_ANSWERED`       | `const CALL_STATE_ANSWERED: &str`       | yes      | —       | —                                                                                                                                                                                                                                |
| `CALL_STATE_CREATED`        | `const CALL_STATE_CREATED: &str`        | yes      | —       | —                                                                                                                                                                                                                                |
| `CALL_STATE_ENDED`          | `const CALL_STATE_ENDED: &str`          | yes      | —       | —                                                                                                                                                                                                                                |
| `CALL_STATE_ENDING`         | `const CALL_STATE_ENDING: &str`         | yes      | —       | —                                                                                                                                                                                                                                |
| `CALL_STATE_RINGING`        | `const CALL_STATE_RINGING: &str`        | yes      | —       | —                                                                                                                                                                                                                                |
| `DIAL_STATE_ANSWERED`       | `const DIAL_STATE_ANSWERED: &str`       | yes      | —       | —                                                                                                                                                                                                                                |
| `DIAL_STATE_DIALING`        | `const DIAL_STATE_DIALING: &str`        | yes      | —       | —                                                                                                                                                                                                                                |
| `DIAL_STATE_FAILED`         | `const DIAL_STATE_FAILED: &str`         | yes      | —       | —                                                                                                                                                                                                                                |
| `MESSAGE_STATE_DELIVERED`   | `const MESSAGE_STATE_DELIVERED: &str`   | yes      | —       | —                                                                                                                                                                                                                                |
| `MESSAGE_STATE_FAILED`      | `const MESSAGE_STATE_FAILED: &str`      | yes      | —       | —                                                                                                                                                                                                                                |
| `MESSAGE_STATE_INITIATED`   | `const MESSAGE_STATE_INITIATED: &str`   | yes      | —       | —                                                                                                                                                                                                                                |
| `MESSAGE_STATE_QUEUED`      | `const MESSAGE_STATE_QUEUED: &str`      | yes      | —       | —                                                                                                                                                                                                                                |
| `MESSAGE_STATE_RECEIVED`    | `const MESSAGE_STATE_RECEIVED: &str`    | yes      | —       | —                                                                                                                                                                                                                                |
| `MESSAGE_STATE_SENT`        | `const MESSAGE_STATE_SENT: &str`        | yes      | —       | —                                                                                                                                                                                                                                |
| `MESSAGE_STATE_UNDELIVERED` | `const MESSAGE_STATE_UNDELIVERED: &str` | yes      | —       | —                                                                                                                                                                                                                                |
| `PROTOCOL_VERSION_MAJOR`    | `const PROTOCOL_VERSION_MAJOR: u32`     | yes      | —       | RELAY protocol constants. Mirrors the PHP `Constants` class: protocol version, call/dial/message states, terminal-state maps, and per-event-type action terminal states. Protocol version exchanged during `signalwire.connect`. |
| `PROTOCOL_VERSION_MINOR`    | `const PROTOCOL_VERSION_MINOR: u32`     | yes      | —       | —                                                                                                                                                                                                                                |
| `PROTOCOL_VERSION_REVISION` | `const PROTOCOL_VERSION_REVISION: u32`  | yes      | —       | —                                                                                                                                                                                                                                |

## Functions

- [`is_action_terminal`](/reference/rust/signalwire/relay/constants/is-action-terminal) — Returns `true` when the given `(event_type, action_state)` pair represents a terminal state for an in-flight action.
- [`is_call_terminal`](/reference/rust/signalwire/relay/constants/is-call-terminal) — Returns `true` when the call state is terminal (i.e. `"ended"`).
- [`is_message_terminal`](/reference/rust/signalwire/relay/constants/is-message-terminal) — Returns `true` when the message state is terminal.

## Source

[`src/relay/constants.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/constants.rs)

Line 1.
