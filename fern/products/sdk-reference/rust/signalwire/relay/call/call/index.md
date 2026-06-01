---
slug: "/reference/rust/signalwire/relay/call/call"
title: "Call"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::relay::call::Call"
  parent: "signalwire::relay::call"
  module: "relay.call"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/call.rs"
  visibility: "public"
---
# `Call`

Represents a RELAY voice call.

Holds call-level state, dispatches server events to registered listeners
and to in-flight Action objects, and exposes every calling.\* RPC method
as a first-class Rust method.

## Signature

```rust
struct Call { /* fields */ }
```

## Properties

| Name            | Type            | Required | Default | Description |
| --------------- | --------------- | -------- | ------- | ----------- |
| `actions`       | `?<?<?, ?<?>>>` | yes      | —       | —           |
| `call_id`       | `?<?>`          | yes      | —       | —           |
| `context`       | `?<?>`          | yes      | —       | —           |
| `device`        | `?<?>`          | yes      | —       | —           |
| `dial_winner`   | `?<bool>`       | yes      | —       | —           |
| `end_reason`    | `?<?<?>>`       | yes      | —       | —           |
| `node_id`       | `?<?>`          | yes      | —       | —           |
| `peer`          | `?<?>`          | yes      | —       | —           |
| `sent_commands` | `?<?<(?, ?)>>`  | yes      | —       | —           |
| `state`         | `?<?>`          | yes      | —       | —           |
| `tag`           | `?<?>`          | yes      | —       | —           |

## Methods

- [`ai`](/reference/rust/signalwire/relay/call/call/ai)
- [`ai_hold`](/reference/rust/signalwire/relay/call/call/ai-hold)
- [`ai_message`](/reference/rust/signalwire/relay/call/call/ai-message)
- [`ai_unhold`](/reference/rust/signalwire/relay/call/call/ai-unhold)
- [`amazon_bedrock`](/reference/rust/signalwire/relay/call/call/amazon-bedrock)
- [`answer`](/reference/rust/signalwire/relay/call/call/answer)
- [`bind_digit`](/reference/rust/signalwire/relay/call/call/bind-digit)
- [`clear_digit_bindings`](/reference/rust/signalwire/relay/call/call/clear-digit-bindings)
- [`collect`](/reference/rust/signalwire/relay/call/call/collect)
- [`connect`](/reference/rust/signalwire/relay/call/call/connect)
- [`current_state`](/reference/rust/signalwire/relay/call/call/current-state) — Current call state.
- [`denoise`](/reference/rust/signalwire/relay/call/call/denoise)
- [`denoise_stop`](/reference/rust/signalwire/relay/call/call/denoise-stop)
- [`detect`](/reference/rust/signalwire/relay/call/call/detect)
- [`disconnect`](/reference/rust/signalwire/relay/call/call/disconnect)
- [`dispatch_event`](/reference/rust/signalwire/relay/call/call/dispatch-event) — Central event router invoked by the Client whenever a server event targets this call.
- [`echo_call`](/reference/rust/signalwire/relay/call/call/echo-call)
- [`hangup`](/reference/rust/signalwire/relay/call/call/hangup)
- [`hold`](/reference/rust/signalwire/relay/call/call/hold)
- [`join_conference`](/reference/rust/signalwire/relay/call/call/join-conference)
- [`join_room`](/reference/rust/signalwire/relay/call/call/join-room)
- [`leave_conference`](/reference/rust/signalwire/relay/call/call/leave-conference)
- [`leave_room`](/reference/rust/signalwire/relay/call/call/leave-room)
- [`live_transcribe`](/reference/rust/signalwire/relay/call/call/live-transcribe)
- [`live_translate`](/reference/rust/signalwire/relay/call/call/live-translate)
- [`new`](/reference/rust/signalwire/relay/call/call/new) — Construct a Call from a server params object.
- [`on`](/reference/rust/signalwire/relay/call/call/on) — Register a generic event listener on this call.
- [`pass`](/reference/rust/signalwire/relay/call/call/pass)
- [`pay`](/reference/rust/signalwire/relay/call/call/pay)
- [`play`](/reference/rust/signalwire/relay/call/call/play)
- [`play_and_collect`](/reference/rust/signalwire/relay/call/call/play-and-collect)
- [`queue_enter`](/reference/rust/signalwire/relay/call/call/queue-enter)
- [`queue_leave`](/reference/rust/signalwire/relay/call/call/queue-leave)
- [`receive_fax`](/reference/rust/signalwire/relay/call/call/receive-fax)
- [`record`](/reference/rust/signalwire/relay/call/call/record)
- [`refer_call`](/reference/rust/signalwire/relay/call/call/refer-call)
- [`repr`](/reference/rust/signalwire/relay/call/call/repr) — Python-style `__repr__` (mirrors `Call.__repr__` in the signalwire-python reference). Returns a string of the form `Call(call_id=..., state=...)`.
- [`resolve_all_actions`](/reference/rust/signalwire/relay/call/call/resolve-all-actions) — Mark every outstanding action as completed.
- [`send_digits`](/reference/rust/signalwire/relay/call/call/send-digits)
- [`send_fax`](/reference/rust/signalwire/relay/call/call/send-fax)
- [`stream`](/reference/rust/signalwire/relay/call/call/stream)
- [`tap`](/reference/rust/signalwire/relay/call/call/tap)
- [`transcribe`](/reference/rust/signalwire/relay/call/call/transcribe)
- [`transfer`](/reference/rust/signalwire/relay/call/call/transfer)
- [`unhold`](/reference/rust/signalwire/relay/call/call/unhold)
- [`user_event`](/reference/rust/signalwire/relay/call/call/user-event)

## Source

[`src/relay/call.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/call.rs)

Line 19.
