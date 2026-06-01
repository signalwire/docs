---
slug: "/reference/dotnet/signal-wire.relay/fax-action"
title: "FaxAction"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.FaxAction"
  parent: "SignalWire.Relay"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `FaxAction`

Handle for calling.fax operations (send or receive).

## Signature

```dotnet
public class FaxAction : Action
```

## Inheritance

**Extends:** [SignalWire.Relay.Action](/reference/dotnet/signal-wire.relay/action)

## Properties

| Name      | Type                             | Required | Default | Description |
| --------- | -------------------------------- | -------- | ------- | ----------- |
| `FaxType` | `public string FaxType { get; }` | yes      | —       | —           |

## Methods

- [`FaxAction(string, string, string, object, string)`](/reference/dotnet/signal-wire.relay/fax-action/fax-action-string-string-string-object-string)
- [`GetStopMethod()`](/reference/dotnet/signal-wire.relay/fax-action/get-stop-method) — Return the RELAY RPC method that stops this action. Subclasses MUST override to return the correct method name.
