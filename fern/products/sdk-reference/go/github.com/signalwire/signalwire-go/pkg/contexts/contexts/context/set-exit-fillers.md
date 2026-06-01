---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/context/set-exit-fillers"
title: "SetExitFillers"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.Context.SetExitFillers"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts.Context"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `SetExitFillers`

SetExitFillers sets all exit fillers at once.

## Signature

```go
func (*Context) SetExitFillers(fillers map[string][]string) *Context
```

## Parameters

| Name      | Type                  | Required | Default | Description |
| --------- | --------------------- | -------- | ------- | ----------- |
| `fillers` | `map[string][]string` | yes      | —       | —           |

## Returns

`*Context`

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 646.
