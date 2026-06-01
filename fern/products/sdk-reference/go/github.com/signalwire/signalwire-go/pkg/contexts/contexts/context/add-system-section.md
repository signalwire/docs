---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/add-system-section"
title: "AddSystemSection"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.Context.AddSystemSection"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts.Context"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `AddSystemSection`

AddSystemSection adds a POM section to the system prompt.

## Signature

```go
func (*Context) AddSystemSection(title string, body string) *Context
```

## Parameters

| Name    | Type     | Required | Default | Description |
| ------- | -------- | -------- | ------- | ----------- |
| `title` | `string` | yes      | —       | —           |
| `body`  | `string` | yes      | —       | —           |

## Returns

`*Context`

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 628.
