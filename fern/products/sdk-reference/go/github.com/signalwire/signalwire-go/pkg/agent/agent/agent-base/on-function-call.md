---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/on-function-call"
title: "OnFunctionCall"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.OnFunctionCall"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `OnFunctionCall`

OnFunctionCall dispatches a SWAIG function call to the registered handler.

## Signature

```go
func (*AgentBase) OnFunctionCall(name string, args map[string]any, rawData map[string]any) (any, error)
```

## Parameters

| Name      | Type             | Required | Default | Description |
| --------- | ---------------- | -------- | ------- | ----------- |
| `name`    | `string`         | yes      | —       | —           |
| `args`    | `map[string]any` | yes      | —       | —           |
| `rawData` | `map[string]any` | yes      | —       | —           |

## Returns

`(any, error)`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1059.
