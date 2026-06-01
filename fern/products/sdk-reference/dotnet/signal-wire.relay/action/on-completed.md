---
slug: "/reference/dotnet/signal-wire.relay/action/on-completed"
title: "OnCompleted"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Action.OnCompleted(System.Func<SignalWire.Relay.Action, System.Threading.Tasks.Task>)"
  parent: "SignalWire.Relay.Action"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `OnCompleted`

Register a callback to fire when the action completes.
If the action is already done the callback fires immediately.

## Signature

**Overload 1**

```dotnet
public Action OnCompleted(Func<Action, Task> callback)
```

**Overload 2**

```dotnet
public Action OnCompleted(Action<Action> callback)
```

## Parameters (Overload 1)

| Name       | Type                                                               | Required | Default | Description |
| ---------- | ------------------------------------------------------------------ | -------- | ------- | ----------- |
| `callback` | `System.Func<SignalWire.Relay.Action,System.Threading.Tasks.Task>` | yes      | —       | —           |

## Parameters (Overload 2)

| Name       | Type                                     | Required | Default | Description |
| ---------- | ---------------------------------------- | -------- | ------- | ----------- |
| `callback` | `System.Action<SignalWire.Relay.Action>` | yes      | —       | —           |

## Returns (Overload 1)

`SignalWire.Relay.Action`

## Returns (Overload 2)

`SignalWire.Relay.Action`
