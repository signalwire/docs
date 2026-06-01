---
slug: "/reference/dotnet/signal-wire.relay/message/on-completed"
title: "OnCompleted"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Message.OnCompleted(System.Func<SignalWire.Relay.Message, System.Threading.Tasks.Task>)"
  parent: "SignalWire.Relay.Message"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `OnCompleted`

Register a callback to fire when the message reaches a terminal state.
If the message is already complete the callback fires immediately.

## Signature

**Overload 1**

```dotnet
public Message OnCompleted(Func<Message, Task> callback)
```

**Overload 2**

```dotnet
public Message OnCompleted(Action<Message> callback)
```

## Parameters (Overload 1)

| Name       | Type                                                                | Required | Default | Description |
| ---------- | ------------------------------------------------------------------- | -------- | ------- | ----------- |
| `callback` | `System.Func<SignalWire.Relay.Message,System.Threading.Tasks.Task>` | yes      | —       | —           |

## Parameters (Overload 2)

| Name       | Type                                      | Required | Default | Description |
| ---------- | ----------------------------------------- | -------- | ------- | ----------- |
| `callback` | `System.Action<SignalWire.Relay.Message>` | yes      | —       | —           |

## Returns (Overload 1)

`SignalWire.Relay.Message`

## Returns (Overload 2)

`SignalWire.Relay.Message`
