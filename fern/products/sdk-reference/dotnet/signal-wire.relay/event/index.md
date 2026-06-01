---
slug: "/reference/dotnet/signal-wire.relay/event"
title: "Event"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Event"
  parent: "SignalWire.Relay"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `Event`

Represents a single RELAY event received from the server.
Carries the event type, a timestamp, and the params dictionary
from which call\_id, node\_id, control\_id, tag, and state are extracted.

**Modifiers:** `sealed`

## Signature

```dotnet
public sealed class Event
```

## Properties

| Name        | Type                                                 | Required | Default | Description |
| ----------- | ---------------------------------------------------- | -------- | ------- | ----------- |
| `CallId`    | `public string? CallId { get; }`                     | yes      | —       | —           |
| `ControlId` | `public string? ControlId { get; }`                  | yes      | —       | —           |
| `EventType` | `public string EventType { get; }`                   | yes      | —       | —           |
| `NodeId`    | `public string? NodeId { get; }`                     | yes      | —       | —           |
| `Params`    | `public Dictionary<string, object?> Params { get; }` | yes      | —       | —           |
| `State`     | `public string? State { get; }`                      | yes      | —       | —           |
| `Tag`       | `public string? Tag { get; }`                        | yes      | —       | —           |
| `Timestamp` | `public double Timestamp { get; }`                   | yes      | —       | —           |

## Methods

- [`Event(string, Dictionary<string, object?>, double)`](/reference/dotnet/signal-wire.relay/event/event-string-dictionary-string-object-double)
- [`Parse(string, Dictionary<string, object?>)`](/reference/dotnet/signal-wire.relay/event/parse-string-dictionary-string-object) — Factory: parse an event from its type and params.
- [`ToDict()`](/reference/dotnet/signal-wire.relay/event/to-dict)
