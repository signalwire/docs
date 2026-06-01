---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/contexts/contexts/step/set-skip-user-turn"
title: "SetSkipUserTurn"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/contexts.Step.SetSkipUserTurn"
  parent: "github.com/signalwire/signalwire-go/pkg/contexts.Step"
  module: "github.com.signalwire.signalwire-go.pkg.contexts"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go"
---
# `SetSkipUserTurn`

SetSkipUserTurn sets whether to skip waiting for user input after this step.

## Signature

```go
func (*Step) SetSkipUserTurn(skip bool) *Step
```

## Parameters

| Name   | Type   | Required | Default | Description |
| ------ | ------ | -------- | ------- | ----------- |
| `skip` | `bool` | yes      | —       | —           |

## Returns

`*Step`

## Source

[`pkg/contexts/contexts.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/contexts/contexts.go)

Line 272.
