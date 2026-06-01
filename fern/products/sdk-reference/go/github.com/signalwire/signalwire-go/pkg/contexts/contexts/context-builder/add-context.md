---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context-builder/add-context"
title: "AddContext"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.ContextBuilder.AddContext"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts.ContextBuilder"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `AddContext`

AddContext creates a new context with the given name and returns it.

## Signature

```go
func (*ContextBuilder) AddContext(name string) *Context
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `name` | `string` | yes      | —       | —           |

## Returns

`*Context`

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 831.
