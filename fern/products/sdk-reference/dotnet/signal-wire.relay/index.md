---
slug: "/reference/dotnet/signal-wire.relay"
title: "SignalWire.Relay"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "module"
  language: "dotnet"
  qualified_name: "SignalWire.Relay"
---
# `SignalWire.Relay`

## Classes

- [`Action`](/reference/dotnet/signal-wire.relay/action) — Base class for all RELAY call actions (play, record, collect, etc.). An Action is the client-side handle returned when you start an asynchronous operation on a call. It accumulates events, tracks state, and resolves once the operation reaches a terminal state. Uses <xref href="System.Threading.Tasks.TaskCompletionSource" data-throw-if-not-resolved="false"></xref> for native async/await support.
- [`AIAction`](/reference/dotnet/signal-wire.relay/ai-action) — Handle for calling.ai operations.
- [`Call`](/reference/dotnet/signal-wire.relay/call) — Represents a RELAY voice call. Holds call-level state, dispatches server events to registered listeners and to in-flight Action objects, and exposes every calling.\* RPC method as a first-class C# method.
- [`Client`](/reference/dotnet/signal-wire.relay/client) — RELAY Client -- manages the WebSocket connection to SignalWire, sends JSON-RPC 2.0 requests, and dispatches inbound events to the correct Call or Message objects. Uses async/await with <xref href="System.Threading.Tasks.TaskCompletionSource" data-throw-if-not-resolved="false"></xref> for the native C# async pattern instead of polling loops.
- [`CollectAction`](/reference/dotnet/signal-wire.relay/collect-action) — Handle for calling.collect (and play\_and\_collect) operations. Note: play\_and\_collect emits intermediate calling.call.play events that must be silently ignored so they do not pollute the collect action's state.
- [`Constants`](/reference/dotnet/signal-wire.relay/constants) — Protocol constants for the RELAY WebSocket interface. Defines protocol version, call/dial/message states, terminal states, and per-event-type action terminal states.
- [`DetectAction`](/reference/dotnet/signal-wire.relay/detect-action) — Handle for calling.detect operations.
- [`Event`](/reference/dotnet/signal-wire.relay/event) — Represents a single RELAY event received from the server. Carries the event type, a timestamp, and the params dictionary from which call\_id, node\_id, control\_id, tag, and state are extracted.
- [`FaxAction`](/reference/dotnet/signal-wire.relay/fax-action) — Handle for calling.fax operations (send or receive).
- [`Message`](/reference/dotnet/signal-wire.relay/message) — Represents a RELAY messaging message (SMS / MMS). A Message is created when you send or receive a message through the RELAY messaging namespace. It accumulates state-change events and resolves once the message reaches a terminal state (delivered, undelivered, or failed). Uses <xref href="System.Threading.Tasks.TaskCompletionSource" data-throw-if-not-resolved="false"></xref> for native async/await support.
- [`PayAction`](/reference/dotnet/signal-wire.relay/pay-action) — Handle for calling.pay operations.
- [`PlayAction`](/reference/dotnet/signal-wire.relay/play-action) — Handle for calling.play operations.
- [`RecordAction`](/reference/dotnet/signal-wire.relay/record-action) — Handle for calling.record operations.
- [`StreamAction`](/reference/dotnet/signal-wire.relay/stream-action) — Handle for calling.stream operations.
- [`TapAction`](/reference/dotnet/signal-wire.relay/tap-action) — Handle for calling.tap operations.
- [`TranscribeAction`](/reference/dotnet/signal-wire.relay/transcribe-action) — Handle for calling.transcribe operations.
