---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-mcp-servers"
title: "WithMCPServers"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.WithMCPServers"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `WithMCPServers`

WithMCPServers is a LiveKit-compatible noop — MCP servers are not yet supported in LiveWire. Tools should be registered via FunctionTool. Mirrors Python Agent(mcp\_servers=...) which emits a one-time noop warning.

## Signature

```go
func WithMCPServers(servers ...any) AgentOption
```

## Parameters

| Name         | Type  | Required | Default | Description |
| ------------ | ----- | -------- | ------- | ----------- |
| `...servers` | `any` | no       | —       | —           |

## Returns

`AgentOption`

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 156.
