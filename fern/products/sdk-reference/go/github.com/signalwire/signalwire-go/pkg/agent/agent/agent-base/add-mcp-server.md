---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-mcp-server"
title: "AddMcpServer"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.AddMcpServer"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `AddMcpServer`

AddMcpServer adds an external MCP server for tool discovery and invocation. Tools are discovered via the MCP protocol at session start and registered as SWAIG functions. Returns self for method chaining.

## Signature

```go
func (*AgentBase) AddMcpServer(cfg MCPServerConfig) *AgentBase
```

## Parameters

| Name  | Type              | Required | Default | Description |
| ----- | ----------------- | -------- | ------- | ----------- |
| `cfg` | `MCPServerConfig` | yes      | —       | —           |

## Returns

`*AgentBase`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1863.
