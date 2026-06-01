---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/get-step"
title: "GetStep"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.Context.GetStep"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts.Context"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `GetStep`

GetStep returns the step with the given name, or nil if not found.

## Signature

```go
func (*Context) GetStep(name string) *Step
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `name` | `string` | yes      | —       | —           |

## Returns

`*Step`

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 486.
