---
slug: "/reference/dotnet/signal-wire.server/agent-server/serve-static-string-string"
title: "ServeStatic(string, string)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Server.AgentServer.ServeStatic(string, string)"
  parent: "SignalWire.Server.AgentServer"
  module: "SignalWire.Server"
  visibility: "public"
---
# `ServeStatic(string, string)`

Serve static files from <code class="paramref">directory</code> under <code class="paramref">urlPrefix</code>.
Throws if the directory does not exist.

## Signature

```dotnet
public AgentServer ServeStatic(string directory, string urlPrefix)
```

## Parameters

| Name        | Type     | Required | Default | Description |
| ----------- | -------- | -------- | ------- | ----------- |
| `directory` | `string` | yes      | —       | —           |
| `urlPrefix` | `string` | yes      | —       | —           |

## Returns

`SignalWire.Server.AgentServer`
