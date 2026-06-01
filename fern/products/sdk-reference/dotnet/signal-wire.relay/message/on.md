---
slug: "/reference/dotnet/signal-wire.relay/message/on"
title: "On"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Message.On(System.Func<SignalWire.Relay.Message, SignalWire.Relay.Event, System.Threading.Tasks.Task>)"
  parent: "SignalWire.Relay.Message"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `On`

Register a listener that fires on every state-change event.

## Signature

**Overload 1**

```dotnet
public Message On(Func<Message, Event, Task> callback)
```

**Overload 2**

```dotnet
public Message On(Action<Message, Event> callback)
```

## Parameters (Overload 1)

| Name       | Type                                                                                       | Required | Default | Description |
| ---------- | ------------------------------------------------------------------------------------------ | -------- | ------- | ----------- |
| `callback` | `System.Func<SignalWire.Relay.Message,SignalWire.Relay.Event,System.Threading.Tasks.Task>` | yes      | —       | —           |

## Parameters (Overload 2)

| Name       | Type                                                             | Required | Default | Description |
| ---------- | ---------------------------------------------------------------- | -------- | ------- | ----------- |
| `callback` | `System.Action<SignalWire.Relay.Message,SignalWire.Relay.Event>` | yes      | —       | —           |

## Returns (Overload 1)

`SignalWire.Relay.Message`

## Returns (Overload 2)

`SignalWire.Relay.Message`
