---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-use-pom"
title: "WithUsePom"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.WithUsePom"
  parent: "github.com/signalwire/signalwire-go/pkg/agent"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `WithUsePom`

WithUsePom controls whether Prompt Object Model (POM) mode is active. When true (default), structured prompt sections are used; when false, raw text from SetPromptText is used.

Python equivalent: use\_pom parameter in AgentBase.**init**

## Signature

```go
func WithUsePom(usePom bool) AgentOption
```

## Parameters

| Name     | Type   | Required | Default | Description |
| -------- | ------ | -------- | ------- | ----------- |
| `usePom` | `bool` | yes      | —       | —           |

## Returns

`AgentOption`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 199.
