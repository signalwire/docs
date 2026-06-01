---
slug: "/reference/dotnet/signal-wire.relay/client/send-message-async-dictionary-string-object"
title: "SendMessageAsync(Dictionary<string, object?>)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Client.SendMessageAsync(System.Collections.Generic.Dictionary<string, object?>)"
  parent: "SignalWire.Relay.Client"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `SendMessageAsync(Dictionary<string, object?>)`

Send an outbound message.

## Signature

```dotnet
public Task<Message> SendMessageAsync(Dictionary<string, object?> params_)
```

## Parameters

| Name      | Type                        | Required | Default | Description |
| --------- | --------------------------- | -------- | ------- | ----------- |
| `params_` | `Dictionary<string,object>` | yes      | —       | —           |

## Returns

`System.Threading.Tasks.Task<SignalWire.Relay.Message>`
