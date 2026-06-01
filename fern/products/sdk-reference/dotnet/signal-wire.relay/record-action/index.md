---
slug: "/reference/dotnet/signal-wire.relay/record-action"
title: "RecordAction"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.RecordAction"
  parent: "SignalWire.Relay"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `RecordAction`

Handle for calling.record operations.

## Signature

```dotnet
public class RecordAction : Action
```

## Inheritance

**Extends:** [SignalWire.Relay.Action](/reference/dotnet/signal-wire.relay/action)

## Properties

| Name       | Type                               | Required | Default | Description |
| ---------- | ---------------------------------- | -------- | ------- | ----------- |
| `Duration` | `public double? Duration { get; }` | yes      | —       | —           |
| `Size`     | `public int? Size { get; }`        | yes      | —       | —           |
| `Url`      | `public string? Url { get; }`      | yes      | —       | —           |

## Methods

- [`GetStopMethod()`](/reference/dotnet/signal-wire.relay/record-action/get-stop-method) — Return the RELAY RPC method that stops this action. Subclasses MUST override to return the correct method name.
- [`Pause(string?)`](/reference/dotnet/signal-wire.relay/record-action/pause-string)
- [`RecordAction(string, string, string, object)`](/reference/dotnet/signal-wire.relay/record-action/record-action-string-string-string-object)
- [`Resume()`](/reference/dotnet/signal-wire.relay/record-action/resume)
