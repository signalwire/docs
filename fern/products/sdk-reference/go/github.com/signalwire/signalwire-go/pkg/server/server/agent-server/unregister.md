---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/agent-server/unregister"
title: "Unregister"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/server.AgentServer.Unregister"
  parent: "github.com/signalwire/signalwire-go/pkg/server.AgentServer"
  module: "github.com.signalwire.signalwire-go.pkg.server"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go"
---
# `Unregister`

Unregister removes the agent at the given route. Returns true if an agent was found and removed.

## Signature

```go
func (*AgentServer) Unregister(route string) bool
```

## Parameters

| Name    | Type     | Required | Default | Description |
| ------- | -------- | -------- | ------- | ----------- |
| `route` | `string` | yes      | —       | —           |

## Returns

`bool`

## Source

[`pkg/server/server.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go)

Line 145.
