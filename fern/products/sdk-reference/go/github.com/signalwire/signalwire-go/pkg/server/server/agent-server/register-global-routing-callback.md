---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/agent-server/register-global-routing-callback"
title: "RegisterGlobalRoutingCallback"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/server.AgentServer.RegisterGlobalRoutingCallback"
  parent: "github.com/signalwire/signalwire-go/pkg/server.AgentServer"
  module: "github.com.signalwire.signalwire-go.pkg.server"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go"
---
# `RegisterGlobalRoutingCallback`

RegisterGlobalRoutingCallback registers a routing callback across all currently-registered agents at the given path. The callback fires on every incoming request to that path and can return an SWML document override (or nil to fall through to the agent's default response).

This is the Go equivalent of Python's AgentServer.register\_global\_routing\_callback(callback\_fn, path).

## Signature

```go
func (*AgentServer) RegisterGlobalRoutingCallback(path string, cb swml.RoutingCallback)
```

## Parameters

| Name   | Type                   | Required | Default | Description |
| ------ | ---------------------- | -------- | ------- | ----------- |
| `path` | `string`               | yes      | —       | —           |
| `cb`   | `swml.RoutingCallback` | yes      | —       | —           |

## Source

[`pkg/server/server.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go)

Line 257.
