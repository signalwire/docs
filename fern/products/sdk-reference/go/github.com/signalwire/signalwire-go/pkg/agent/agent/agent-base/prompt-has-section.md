---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/prompt-has-section"
title: "PromptHasSection"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.PromptHasSection"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `PromptHasSection`

PromptHasSection returns true if a POM section with the given title exists.

## Signature

```go
func (*AgentBase) PromptHasSection(title string) bool
```

## Parameters

| Name    | Type     | Required | Default | Description |
| ------- | -------- | -------- | ------- | ----------- |
| `title` | `string` | yes      | —       | —           |

## Returns

`bool`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 759.
