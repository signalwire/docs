---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/server/server/agent-server/register-sip-username"
title: "RegisterSipUsername"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/server.AgentServer.RegisterSipUsername"
  parent: "github.com/signalwire/signalwire-go/pkg/server.AgentServer"
  module: "github.com.signalwire.signalwire-go.pkg.server"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go"
---
# `RegisterSipUsername`

RegisterSipUsername maps a SIP username to an agent route so that inbound SIP calls for that username are routed to the correct agent.

## Signature

```go
func (*AgentServer) RegisterSipUsername(username string, route string)
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `username` | `string` | yes      | —       | —           |
| `route`    | `string` | yes      | —       | —           |

## Source

[`pkg/server/server.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/server/server.go)

Line 227.
