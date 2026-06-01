---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/connect"
title: "Connect"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult.Connect"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `Connect`

Connect adds a connect action to transfer/connect the call to another destination. If final is true, the call permanently transfers (exits the agent). If final is false, the call returns to the agent when the far end hangs up. The from parameter sets the caller ID; pass empty string to use the call's default.

## Signature

```go
func (*FunctionResult) Connect(destination string, final bool, from string) *FunctionResult
```

## Parameters

| Name          | Type     | Required | Default | Description |
| ------------- | -------- | -------- | ------- | ----------- |
| `destination` | `string` | yes      | —       | —           |
| `final`       | `bool`   | yes      | —       | —           |
| `from`        | `string` | yes      | —       | —           |

## Returns

`*FunctionResult`

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 96.
