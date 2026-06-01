---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/set-user-prompt"
title: "SetUserPrompt"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.Context.SetUserPrompt"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts.Context"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `SetUserPrompt`

SetUserPrompt sets the user prompt to inject when entering this context.

## Signature

```go
func (*Context) SetUserPrompt(prompt string) *Context
```

## Parameters

| Name     | Type     | Required | Default | Description |
| -------- | -------- | -------- | ------- | ----------- |
| `prompt` | `string` | yes      | —       | —           |

## Returns

`*Context`

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 585.
