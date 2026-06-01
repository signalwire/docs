---
slug: "/reference/dotnet/signal-wire.relay/client/send-dictionary-string-object"
title: "Send(Dictionary<string, object?>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Client.Send(System.Collections.Generic.Dictionary<string, object?>)"
  parent: "SignalWire.Relay.Client"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `Send(Dictionary<string, object?>)`

Encode and send a JSON message. Real production path writes to the
WebSocket; tests override this to capture payloads in memory.

**Modifiers:** `virtual`

## Signature

```dotnet
public virtual void Send(Dictionary<string, object?> msg)
```

## Parameters

| Name  | Type                        | Required | Default | Description |
| ----- | --------------------------- | -------- | ------- | ----------- |
| `msg` | `Dictionary<string,object>` | yes      | —       | —           |
