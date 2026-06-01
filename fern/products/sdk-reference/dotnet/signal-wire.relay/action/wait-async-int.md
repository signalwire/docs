---
slug: "/reference/dotnet/signal-wire.relay/action/wait-async-int"
title: "WaitAsync(int)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Action.WaitAsync(int)"
  parent: "SignalWire.Relay.Action"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `WaitAsync(int)`

Await until the action completes or the timeout elapses.
Returns the resolved result, or null on timeout.

## Signature

```dotnet
public Task<object?> WaitAsync(int timeoutSeconds = 30)
```

## Parameters

| Name             | Type  | Required | Default | Description |
| ---------------- | ----- | -------- | ------- | ----------- |
| `timeoutSeconds` | `int` | no       | `30`    | —           |

## Returns

`System.Threading.Tasks.Task<object>`
