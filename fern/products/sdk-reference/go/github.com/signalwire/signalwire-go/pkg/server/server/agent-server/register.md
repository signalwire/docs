---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/agent-server/register"
title: "Register"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/server.AgentServer.Register"
  parent: "github.com/signalwire/signalwire-go/pkg/server.AgentServer"
  module: "github.com.signalwire.signalwire-go.pkg.server"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go"
---
# `Register`

Register adds an agent to the server at the given route. If route is empty the agent's configured route (via WithRoute) is used instead. The route is normalised to always start with "/".

## Signature

```go
func (*AgentServer) Register(a *agent.AgentBase, route string)
```

## Parameters

| Name    | Type               | Required | Default | Description |
| ------- | ------------------ | -------- | ------- | ----------- |
| `a`     | `*agent.AgentBase` | yes      | —       | —           |
| `route` | `string`           | yes      | —       | —           |

## Source

[`pkg/server/server.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go)

Line 120.
