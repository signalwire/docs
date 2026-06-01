---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-pre-answer-verb"
title: "AddPreAnswerVerb"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.AddPreAnswerVerb"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `AddPreAnswerVerb`

AddPreAnswerVerb adds a SWML verb to execute before the answer.

## Signature

```go
func (*AgentBase) AddPreAnswerVerb(verbName string, config map[string]any) *AgentBase
```

## Parameters

| Name       | Type             | Required | Default | Description |
| ---------- | ---------------- | -------- | ------- | ----------- |
| `verbName` | `string`         | yes      | —       | —           |
| `config`   | `map[string]any` | yes      | —       | —           |

## Returns

`*AgentBase`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1525.
