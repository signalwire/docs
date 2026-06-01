---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-dynamic-config-callback"
title: "SetDynamicConfigCallback"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.SetDynamicConfigCallback"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `SetDynamicConfigCallback`

SetDynamicConfigCallback sets a callback invoked on each request to allow per-request agent customisation.

## Signature

```go
func (*AgentBase) SetDynamicConfigCallback(cb DynamicConfigCallback) *AgentBase
```

## Parameters

| Name | Type                    | Required | Default | Description |
| ---- | ----------------------- | -------- | ------- | ----------- |
| `cb` | `DynamicConfigCallback` | yes      | —       | —           |

## Returns

`*AgentBase`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1634.
