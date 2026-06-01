---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/get-all-functions"
title: "GetAllFunctions"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.GetAllFunctions"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `GetAllFunctions`

GetAllFunctions returns a snapshot of all registered SWAIG functions keyed by name. The returned map is a copy — subsequent registrations do not mutate it. (Python parity: “ToolRegistry.get\_all\_functions“.)

## Signature

```go
func (*AgentBase) GetAllFunctions() map[string]*ToolDefinition
```

## Returns

`map[string]*ToolDefinition`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1016.
