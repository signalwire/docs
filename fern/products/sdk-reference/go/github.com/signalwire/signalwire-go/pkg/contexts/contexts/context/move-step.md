---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/move-step"
title: "MoveStep"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.Context.MoveStep"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts.Context"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `MoveStep`

MoveStep moves an existing step to the given position (0-based index). Returns the receiver for method chaining.

## Signature

```go
func (*Context) MoveStep(name string, position int) *Context
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `name`     | `string` | yes      | —       | —           |
| `position` | `int`    | yes      | —       | —           |

## Returns

`*Context`

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 507.
