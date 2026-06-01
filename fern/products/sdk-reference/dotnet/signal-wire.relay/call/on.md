---
slug: "/reference/dotnet/signal-wire.relay/call/on"
title: "On"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Call.On(System.Action<SignalWire.Relay.Event, SignalWire.Relay.Call>)"
  parent: "SignalWire.Relay.Call"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `On`

Register a generic event listener on this call.

## Signature

**Overload 1**

```dotnet
public Call On(Action<Event, Call> callback)
```

**Overload 2**

```dotnet
public Call On(string eventType, Action<Event> callback)
```

## Parameters (Overload 1)

| Name       | Type                                                          | Required | Default | Description |
| ---------- | ------------------------------------------------------------- | -------- | ------- | ----------- |
| `callback` | `System.Action<SignalWire.Relay.Event,SignalWire.Relay.Call>` | yes      | —       | —           |

## Parameters (Overload 2)

| Name        | Type                                    | Required | Default | Description |
| ----------- | --------------------------------------- | -------- | ------- | ----------- |
| `eventType` | `string`                                | yes      | —       | —           |
| `callback`  | `System.Action<SignalWire.Relay.Event>` | yes      | —       | —           |

## Returns (Overload 1)

`SignalWire.Relay.Call`

## Returns (Overload 2)

`SignalWire.Relay.Call`
