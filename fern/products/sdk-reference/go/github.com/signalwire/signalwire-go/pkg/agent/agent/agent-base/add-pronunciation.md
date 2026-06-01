---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/add-pronunciation"
title: "AddPronunciation"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.AddPronunciation"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `AddPronunciation`

AddPronunciation adds a pronunciation override rule.

Python equivalent: ai\_config\_mixin.AIConfigMixin.add\_pronunciation Python signature: add\_pronunciation(replace, with\_text, ignore\_case=False)

Parameters:

- replace: the word or expression to match
- withText: the phonetic spelling to substitute
- ignoreCase: when true, matching ignores case (Python: ignore\_case)

## Signature

```go
func (*AgentBase) AddPronunciation(replace string, withText string, ignoreCase ...bool) *AgentBase
```

## Parameters

| Name            | Type     | Required | Default | Description |
| --------------- | -------- | -------- | ------- | ----------- |
| `replace`       | `string` | yes      | —       | —           |
| `withText`      | `string` | yes      | —       | —           |
| `...ignoreCase` | `bool`   | no       | —       | —           |

## Returns

`*AgentBase`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1285.
