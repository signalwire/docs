---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/simulate-user-input"
title: "SimulateUserInput"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult.SimulateUserInput"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `SimulateUserInput`

SimulateUserInput queues simulated user input text. Emits action key "user\_input" matching the Python SDK's add\_action("user\_input", text).

## Signature

```go
func (*FunctionResult) SimulateUserInput(text string) *FunctionResult
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `text` | `string` | yes      | —       | —           |

## Returns

`*FunctionResult`

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 933.
