---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-session-mcp-servers"
title: "WithSessionMCPServers"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.WithSessionMCPServers"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `WithSessionMCPServers`

WithSessionMCPServers stores the MCP servers value on the session — noop on SignalWire. Mirrors Python AgentSession(mcp\_servers=...) which emits a one-time noop warning (lines 450–456).

## Signature

```go
func WithSessionMCPServers(servers any) SessionOption
```

## Parameters

| Name      | Type  | Required | Default | Description |
| --------- | ----- | -------- | ------- | ----------- |
| `servers` | `any` | yes      | —       | —           |

## Returns

`SessionOption`

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 459.
