---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/prompt-add-section"
title: "PromptAddSection"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.PromptAddSection"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `PromptAddSection`

PromptAddSection appends a new section to the POM prompt.

Python equivalent: prompt\_mixin.PromptMixin.prompt\_add\_section Added params to match Python signature: numbered, numberedBullets, subsections. - numbered: if true the section itself is rendered with a numeric marker - numberedBullets: if true the bullet list is rendered with numbers - subsections: optional list of child section maps (each with "title", "body", "bullets")

## Signature

```go
func (*AgentBase) PromptAddSection(
	title string,
	body string,
	bullets []string,
	opts ...PromptSectionOption
) *AgentBase
```

## Parameters

| Name      | Type                  | Required | Default | Description |
| --------- | --------------------- | -------- | ------- | ----------- |
| `title`   | `string`              | yes      | —       | —           |
| `body`    | `string`              | yes      | —       | —           |
| `bullets` | `[]string`            | yes      | —       | —           |
| `...opts` | `PromptSectionOption` | no       | —       | —           |

## Returns

`*AgentBase`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 611.
