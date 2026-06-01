---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/manual-set-proxy-url"
title: "ManualSetProxyUrl"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.ManualSetProxyUrl"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `ManualSetProxyUrl`

ManualSetProxyUrl overrides the proxy URL base used for webhook URL generation.

## Signature

```go
func (*AgentBase) ManualSetProxyUrl(url string) *AgentBase
```

## Parameters

| Name  | Type     | Required | Default | Description |
| ----- | -------- | -------- | ------- | ----------- |
| `url` | `string` | yes      | —       | —           |

## Returns

`*AgentBase`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1642.
