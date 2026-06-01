---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/execute-swml"
title: "ExecuteSwml"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult.ExecuteSwml"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `ExecuteSwml`

ExecuteSwml executes SWML content. If transfer is true, the call exits the agent after execution. swmlContent can be a map\[string]any or a string (raw SWML JSON).

## Signature

```go
func (*FunctionResult) ExecuteSwml(swmlContent any, transfer bool) *FunctionResult
```

## Parameters

| Name          | Type   | Required | Default | Description |
| ------------- | ------ | -------- | ------- | ----------- |
| `swmlContent` | `any`  | yes      | —       | —           |
| `transfer`    | `bool` | yes      | —       | —           |

## Returns

`*FunctionResult`

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 446.
