---
slug: "/reference/dotnet/signal-wire.relay/action/resolve-object"
title: "Resolve(object?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Action.Resolve(object?)"
  parent: "SignalWire.Relay.Action"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `Resolve(object?)`

Mark this action as completed. The optional result is stored and the
onCompleted callback fires exactly once.

## Signature

```dotnet
public void Resolve(object? result = null)
```

## Parameters

| Name     | Type     | Required | Default | Description |
| -------- | -------- | -------- | ------- | ----------- |
| `result` | `object` | no       | `null`  | —           |
