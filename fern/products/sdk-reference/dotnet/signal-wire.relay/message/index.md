---
slug: "/reference/dotnet/signal-wire.relay/message"
title: "Message"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Message"
  parent: "SignalWire.Relay"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `Message`

Represents a RELAY messaging message (SMS / MMS).

A Message is created when you send or receive a message through the
RELAY messaging namespace. It accumulates state-change events and
resolves once the message reaches a terminal state (delivered,
undelivered, or failed).

Uses <xref href="System.Threading.Tasks.TaskCompletionSource" data-throw-if-not-resolved="false"></xref> for native async/await support.

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class Message
```

## Properties

| Name         | Type                                 | Required | Default | Description |
| ------------ | ------------------------------------ | -------- | ------- | ----------- |
| `Body`       | `public string? Body { get; }`       | yes      | —       | —           |
| `Completed`  | `public bool Completed { get; }`     | yes      | —       | —           |
| `Context`    | `public string? Context { get; }`    | yes      | —       | —           |
| `Direction`  | `public string? Direction { get; }`  | yes      | —       | —           |
| `FromNumber` | `public string? FromNumber { get; }` | yes      | —       | —           |
| `IsDone`     | `public bool IsDone { get; }`        | yes      | —       | —           |
| `Media`      | `public List<string> Media { get; }` | yes      | —       | —           |
| `MessageId`  | `public string? MessageId { get; }`  | yes      | —       | —           |
| `Reason`     | `public string? Reason { get; }`     | yes      | —       | —           |
| `Result`     | `public string? Result { get; }`     | yes      | —       | —           |
| `State`      | `public string? State { get; }`      | yes      | —       | —           |
| `Tags`       | `public List<string> Tags { get; }`  | yes      | —       | —           |
| `ToNumber`   | `public string? ToNumber { get; }`   | yes      | —       | —           |

## Methods

- [`DispatchEvent(Event)`](/reference/dotnet/signal-wire.relay/message/dispatch-event-event) — Process an inbound event for this message. Updates state/reason, fires registered event listeners, and auto-resolves when a terminal state is reached.
- [`Message(Dictionary<string, object?>?)`](/reference/dotnet/signal-wire.relay/message/message-dictionary-string-object) — Build a Message from a params dictionary (as returned by the server).
- [`On`](/reference/dotnet/signal-wire.relay/message/on) — Register a listener that fires on every state-change event.
- [`OnCompleted`](/reference/dotnet/signal-wire.relay/message/on-completed) — Register a callback to fire when the message reaches a terminal state. If the message is already complete the callback fires immediately.
- [`Resolve(string?)`](/reference/dotnet/signal-wire.relay/message/resolve-string) — Mark this message as completed. The optional result is stored and the onCompleted callback fires exactly once.
- [`WaitAsync(int)`](/reference/dotnet/signal-wire.relay/message/wait-async-int) — Await until the message completes or the timeout elapses. Returns the resolved result, or null on timeout.
