---
slug: "/reference/dotnet/signal-wire.relay/detect-action"
title: "DetectAction"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.DetectAction"
  parent: "SignalWire.Relay"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `DetectAction`

Handle for calling.detect operations.

## Signature

```dotnet
public class DetectAction : Action
```

## Inheritance

**Extends:** [SignalWire.Relay.Action](/reference/dotnet/signal-wire.relay/action)

## Properties

| Name           | Type                                   | Required | Default | Description |
| -------------- | -------------------------------------- | -------- | ------- | ----------- |
| `DetectResult` | `public object? DetectResult { get; }` | yes      | —       | —           |

## Methods

- [`DetectAction(string, string, string, object)`](/reference/dotnet/signal-wire.relay/detect-action/detect-action-string-string-string-object)
- [`GetStopMethod()`](/reference/dotnet/signal-wire.relay/detect-action/get-stop-method) — Return the RELAY RPC method that stops this action. Subclasses MUST override to return the correct method name.
- [`HandleEvent(Event)`](/reference/dotnet/signal-wire.relay/detect-action/handle-event-event) — Per RELAY\_IMPLEMENTATION\_GUIDE.md "detect gotcha": detect events continuously stream a <code>detect</code> object — resolve on the FIRST meaningful detect payload (or on terminal state if it arrives first with no detect data).
