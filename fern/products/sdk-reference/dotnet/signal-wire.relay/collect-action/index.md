---
slug: "/reference/dotnet/signal-wire.relay/collect-action"
title: "CollectAction"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.CollectAction"
  parent: "SignalWire.Relay"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `CollectAction`

Handle for calling.collect (and play\_and\_collect) operations.

Note: play\_and\_collect emits intermediate calling.call.play events
that must be silently ignored so they do not pollute the collect
action's state.

## Signature

```dotnet
public class CollectAction : Action
```

## Inheritance

**Extends:** [SignalWire.Relay.Action](/reference/dotnet/signal-wire.relay/action)

## Properties

| Name            | Type                                    | Required | Default | Description                                            |
| --------------- | --------------------------------------- | -------- | ------- | ------------------------------------------------------ |
| `CollectResult` | `public object? CollectResult { get; }` | yes      | —       | Return the structured collect result from the payload. |

## Methods

- [`AcceptsTerminalEvent(string)`](/reference/dotnet/signal-wire.relay/collect-action/accepts-terminal-event-string) — Block <code>calling.call.play</code> events from triggering the standard terminal-state resolution path: only <code>calling.call.collect</code> may resolve a CollectAction.
- [`CollectAction(string, string, string, object, bool)`](/reference/dotnet/signal-wire.relay/collect-action/collect-action-string-string-string-object-bool)
- [`GetStopMethod()`](/reference/dotnet/signal-wire.relay/collect-action/get-stop-method) — Return the RELAY RPC method that stops this action. Subclasses MUST override to return the correct method name.
- [`HandleEvent(Event)`](/reference/dotnet/signal-wire.relay/collect-action/handle-event-event) — Override: silently ignore intermediate play events that arrive during a play\_and\_collect operation.
- [`StartInputTimers()`](/reference/dotnet/signal-wire.relay/collect-action/start-input-timers) — Notify the server to start input timers now rather than waiting for the initial-timeout to expire naturally.
- [`Volume(double)`](/reference/dotnet/signal-wire.relay/collect-action/volume-double) — play\_and\_collect-only: change playback volume mid-prompt.
