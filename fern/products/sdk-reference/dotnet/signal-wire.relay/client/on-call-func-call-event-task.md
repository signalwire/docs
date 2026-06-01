---
slug: "/reference/dotnet/signal-wire.relay/client/on-call-func-call-event-task"
title: "OnCall(Func<Call, Event, Task>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Client.OnCall(System.Func<SignalWire.Relay.Call, SignalWire.Relay.Event, System.Threading.Tasks.Task>)"
  parent: "SignalWire.Relay.Client"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `OnCall(Func<Call, Event, Task>)`

Register a handler for inbound calls.

## Signature

```dotnet
public Client OnCall(Func<Call, Event, Task> callback)
```

## Parameters

| Name       | Type                                                                                    | Required | Default | Description |
| ---------- | --------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `callback` | `System.Func<SignalWire.Relay.Call,SignalWire.Relay.Event,System.Threading.Tasks.Task>` | yes      | —       | —           |

## Returns

`SignalWire.Relay.Client`
