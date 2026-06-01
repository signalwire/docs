---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/set-param"
title: "SetParam"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.SetParam"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `SetParam`

SetParam sets a single AI parameter (e.g. temperature, top\_p).

## Signature

```go
func (*AgentBase) SetParam(key string, value any) *AgentBase
```

## Parameters

| Name    | Type     | Required | Default | Description |
| ------- | -------- | -------- | ------- | ----------- |
| `key`   | `string` | yes      | —       | —           |
| `value` | `any`    | yes      | —       | —           |

## Returns

`*AgentBase`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1308.
