---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-enable-post-prompt-override"
title: "WithEnablePostPromptOverride"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.WithEnablePostPromptOverride"
  parent: "github.com/signalwire/signalwire-go/pkg/agent"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `WithEnablePostPromptOverride`

WithEnablePostPromptOverride allows subclasses to override the post-prompt URL with a custom handler. When enabled, the agent registers a /post\_prompt\_override endpoint and routes summary callbacks through it.

Python equivalent: enable\_post\_prompt\_override parameter in AgentBase.**init**

## Signature

```go
func WithEnablePostPromptOverride(enable bool) AgentOption
```

## Parameters

| Name     | Type   | Required | Default | Description |
| -------- | ------ | -------- | ------- | ----------- |
| `enable` | `bool` | yes      | —       | —           |

## Returns

`AgentOption`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 254.
