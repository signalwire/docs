---
slug: "/reference/dotnet/signal-wire.relay/client/read-loop-async-cancellation-token"
title: "ReadLoopAsync(CancellationToken)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Relay.Client.ReadLoopAsync(System.Threading.CancellationToken)"
  parent: "SignalWire.Relay.Client"
  module: "SignalWire.Relay"
  visibility: "public"
---
# `ReadLoopAsync(CancellationToken)`

Reader loop that pulls UTF-8 text frames off the socket and routes
each completed message into <xref href="SignalWire.Relay.Client.HandleMessage(System.String)" data-throw-if-not-resolved="false"></xref>. Handles
fragmented frames by accumulating them until <xref href="System.Net.WebSockets.ValueWebSocketReceiveResult.EndOfMessage" data-throw-if-not-resolved="false"></xref>.

## Signature

```dotnet
public Task ReadLoopAsync(CancellationToken cancellation)
```

## Parameters

| Name           | Type                                 | Required | Default | Description |
| -------------- | ------------------------------------ | -------- | ------- | ----------- |
| `cancellation` | `System.Threading.CancellationToken` | yes      | —       | —           |

## Returns

`System.Threading.Tasks.Task`
