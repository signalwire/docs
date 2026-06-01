---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-skill"
title: "AddSkill"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.AddSkill"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `AddSkill`

AddSkill loads a skill by name with optional params and registers its tools.

## Signature

```go
func (*AgentBase) AddSkill(skillName string, params map[string]any) *AgentBase
```

## Parameters

| Name        | Type             | Required | Default | Description |
| ----------- | ---------------- | -------- | ------- | ----------- |
| `skillName` | `string`         | yes      | —       | —           |
| `params`    | `map[string]any` | yes      | —       | —           |

## Returns

`*AgentBase`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 2234.
