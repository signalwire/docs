---
slug: "/reference/dotnet/signal-wire.relay/tap-action"
title: "TapAction"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.TapAction"
  parent: "SignalWire.Relay"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `TapAction`

Handle for calling.tap operations.

## Signature

```dotnet
public class TapAction : Action
```

## Inheritance

**Extends:** [SignalWire.Relay.Action](/reference/dotnet/signal-wire.relay/action)

## Methods

- [`GetStopMethod()`](/reference/dotnet/signal-wire.relay/tap-action/get-stop-method) — Return the RELAY RPC method that stops this action. Subclasses MUST override to return the correct method name.
- [`TapAction(string, string, string, object)`](/reference/dotnet/signal-wire.relay/tap-action/tap-action-string-string-string-object)
