---
slug: "/reference/dotnet/signal-wire.relay/play-action"
title: "PlayAction"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.PlayAction"
  parent: "SignalWire.Relay"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `PlayAction`

Handle for calling.play operations.

## Signature

```dotnet
public class PlayAction : Action
```

## Inheritance

**Extends:** [SignalWire.Relay.Action](/reference/dotnet/signal-wire.relay/action)

## Methods

- [`GetStopMethod()`](/reference/dotnet/signal-wire.relay/play-action/get-stop-method) — Return the RELAY RPC method that stops this action. Subclasses MUST override to return the correct method name.
- [`Pause()`](/reference/dotnet/signal-wire.relay/play-action/pause)
- [`PlayAction(string, string, string, object)`](/reference/dotnet/signal-wire.relay/play-action/play-action-string-string-string-object)
- [`Resume()`](/reference/dotnet/signal-wire.relay/play-action/resume)
- [`Volume(double)`](/reference/dotnet/signal-wire.relay/play-action/volume-double) — Adjust playback volume in dB.
