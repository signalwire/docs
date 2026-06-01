---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/prompt-add-to-section"
title: "PromptAddToSection"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.PromptAddToSection"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `PromptAddToSection`

PromptAddToSection finds an existing POM section by title and appends text and/or bullets. If the section does not exist, it is a no-op.

Python equivalent: prompt\_mixin.PromptMixin.prompt\_add\_to\_section Added params to match Python signature: bullet (single bullet string) and bullets (\[]string list). When body is non-empty it is appended to the section body. When bullet is non-empty it is added to the bullets list. When bullets is non-nil its elements are appended to the bullets list.

## Signature

```go
func (*AgentBase) PromptAddToSection(title string, body string, opts ...PromptAddToSectionOption) *AgentBase
```

## Parameters

| Name      | Type                       | Required | Default | Description |
| --------- | -------------------------- | -------- | ------- | ----------- |
| `title`   | `string`                   | yes      | —       | —           |
| `body`    | `string`                   | yes      | —       | —           |
| `...opts` | `PromptAddToSectionOption` | no       | —       | —           |

## Returns

`*AgentBase`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 677.
