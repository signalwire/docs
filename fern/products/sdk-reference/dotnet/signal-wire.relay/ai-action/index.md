---
slug: "/reference/dotnet/signal-wire.relay/ai-action"
title: "AIAction"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.AIAction"
  parent: "SignalWire.Relay"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `AIAction`

Handle for calling.ai operations.

## Signature

```dotnet
public class AIAction : Action
```

## Inheritance

**Extends:** [SignalWire.Relay.Action](/reference/dotnet/signal-wire.relay/action)

## Methods

- [`AIAction(string, string, string, object)`](/reference/dotnet/signal-wire.relay/ai-action/ai-action-string-string-string-object)
- [`GetStopMethod()`](/reference/dotnet/signal-wire.relay/ai-action/get-stop-method) — Return the RELAY RPC method that stops this action. Subclasses MUST override to return the correct method name.
