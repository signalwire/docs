---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/new-agent-server"
title: "NewAgentServer"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/server.NewAgentServer"
  parent: "github.com/signalwire/signalwire-go/pkg/server"
  module: "github.com.signalwire.signalwire-go.pkg.server"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go"
---
# `NewAgentServer`

NewAgentServer creates a new AgentServer with the given options. Default host is "0.0.0.0" and default port is 3000.

## Signature

```go
func NewAgentServer(opts ...ServerOption) *AgentServer
```

## Parameters

| Name      | Type           | Required | Default | Description |
| --------- | -------------- | -------- | ------- | ----------- |
| `...opts` | `ServerOption` | no       | —       | —           |

## Returns

`*AgentServer`

## Source

[`pkg/server/server.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go)

Line 94.
