---
slug: "/reference/dotnet/signal-wire.relay/message/resolve-string"
title: "Resolve(string?)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Message.Resolve(string?)"
  parent: "SignalWire.Relay.Message"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `Resolve(string?)`

Mark this message as completed. The optional result is stored and
the onCompleted callback fires exactly once.

## Signature

```dotnet
public void Resolve(string? result = null)
```

## Parameters

| Name     | Type     | Required | Default | Description |
| -------- | -------- | -------- | ------- | ----------- |
| `result` | `string` | no       | `null`  | —           |
