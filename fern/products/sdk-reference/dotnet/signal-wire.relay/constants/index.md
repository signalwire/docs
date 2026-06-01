---
slug: "/reference/dotnet/signal-wire.relay/constants"
title: "Constants"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Constants"
  parent: "SignalWire.Relay"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `Constants`

Protocol constants for the RELAY WebSocket interface.
Defines protocol version, call/dial/message states, terminal states,
and per-event-type action terminal states.

**Modifiers:** `static`

## Signature

```dotnet
public static class Constants
```

## Properties

| Name                      | Type                                                                                      | Required | Default | Description |
| ------------------------- | ----------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `ActionTerminalStates`    | `public static readonly FrozenDictionary<string, FrozenSet<string>> ActionTerminalStates` | yes      | —       | —           |
| `CallStateAnswered`       | `public const string CallStateAnswered = "answered"`                                      | yes      | —       | —           |
| `CallStateCreated`        | `public const string CallStateCreated = "created"`                                        | yes      | —       | —           |
| `CallStateEnded`          | `public const string CallStateEnded = "ended"`                                            | yes      | —       | —           |
| `CallStateEnding`         | `public const string CallStateEnding = "ending"`                                          | yes      | —       | —           |
| `CallStateRinging`        | `public const string CallStateRinging = "ringing"`                                        | yes      | —       | —           |
| `CallTerminalStates`      | `public static readonly FrozenSet<string> CallTerminalStates`                             | yes      | —       | —           |
| `DialStateAnswered`       | `public const string DialStateAnswered = "answered"`                                      | yes      | —       | —           |
| `DialStateDialing`        | `public const string DialStateDialing = "dialing"`                                        | yes      | —       | —           |
| `DialStateFailed`         | `public const string DialStateFailed = "failed"`                                          | yes      | —       | —           |
| `MessageStateDelivered`   | `public const string MessageStateDelivered = "delivered"`                                 | yes      | —       | —           |
| `MessageStateFailed`      | `public const string MessageStateFailed = "failed"`                                       | yes      | —       | —           |
| `MessageStateInitiated`   | `public const string MessageStateInitiated = "initiated"`                                 | yes      | —       | —           |
| `MessageStateQueued`      | `public const string MessageStateQueued = "queued"`                                       | yes      | —       | —           |
| `MessageStateReceived`    | `public const string MessageStateReceived = "received"`                                   | yes      | —       | —           |
| `MessageStateSent`        | `public const string MessageStateSent = "sent"`                                           | yes      | —       | —           |
| `MessageStateUndelivered` | `public const string MessageStateUndelivered = "undelivered"`                             | yes      | —       | —           |
| `MessageTerminalStates`   | `public static readonly FrozenSet<string> MessageTerminalStates`                          | yes      | —       | —           |
| `ProtocolVersion`         | `public static readonly IReadOnlyDictionary<string, int> ProtocolVersion`                 | yes      | —       | —           |
