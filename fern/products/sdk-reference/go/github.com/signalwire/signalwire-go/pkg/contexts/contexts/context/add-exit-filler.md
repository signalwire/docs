---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/add-exit-filler"
title: "AddExitFiller"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.Context.AddExitFiller"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts.Context"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `AddExitFiller`

AddExitFiller adds exit fillers for a specific language code.

## Signature

```go
func (*Context) AddExitFiller(langCode string, fillers []string) *Context
```

## Parameters

| Name       | Type       | Required | Default | Description |
| ---------- | ---------- | -------- | ------- | ----------- |
| `langCode` | `string`   | yes      | —       | —           |
| `fillers`  | `[]string` | yes      | —       | —           |

## Returns

`*Context`

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 661.
