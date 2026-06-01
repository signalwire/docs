---
slug: "/reference/rust/signalwire/relay/client"
title: "client"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "module"
  language: "rust"
  qualified_name: "signalwire::relay::client"
  parent: "signalwire::relay"
  module: "relay"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs"
  visibility: "public"
---
# `client`

## Type Aliases

- [`OnCallHandler`](/reference/rust/signalwire/relay/client/on-call-handler) — Callback type for inbound call handler.
- [`OnEventHandler`](/reference/rust/signalwire/relay/client/on-event-handler) — Callback type for generic events.
- [`OnMessageHandler`](/reference/rust/signalwire/relay/client/on-message-handler) — Callback type for inbound message handler.

## Classes

- [`Client`](/reference/rust/signalwire/relay/client/client) — RELAY Client -- manages the WebSocket connection to SignalWire, sends JSON-RPC requests, and dispatches inbound events to the correct Call or Message objects.

## Source

[`src/relay/client.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/relay/client.rs)

Line 1.
