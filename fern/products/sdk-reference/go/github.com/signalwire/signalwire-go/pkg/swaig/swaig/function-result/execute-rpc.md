---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/execute-rpc"
title: "ExecuteRpc"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult.ExecuteRpc"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `ExecuteRpc`

ExecuteRpc executes an RPC method on a call. Pass empty strings for callID and nodeID to omit them from the payload.

## Signature

```go
func (*FunctionResult) ExecuteRpc(method string, params map[string]any, callID string, nodeID string) *FunctionResult
```

## Parameters

| Name     | Type             | Required | Default | Description |
| -------- | ---------------- | -------- | ------- | ----------- |
| `method` | `string`         | yes      | —       | —           |
| `params` | `map[string]any` | yes      | —       | —           |
| `callID` | `string`         | yes      | —       | —           |
| `nodeID` | `string`         | yes      | —       | —           |

## Returns

`*FunctionResult`

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 865.
