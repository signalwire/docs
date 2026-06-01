---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/remove-global-data-key"
title: "RemoveGlobalDataKey"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult.RemoveGlobalDataKey"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `RemoveGlobalDataKey`

RemoveGlobalDataKey removes a single global agent data variable by key. This matches the Python SDK's Union\[str, List\[str]] behavior for a bare string argument, which emits the key as a string (not a one-element array) in the action payload.

## Signature

```go
func (*FunctionResult) RemoveGlobalDataKey(key string) *FunctionResult
```

## Parameters

| Name  | Type     | Required | Default | Description |
| ----- | -------- | -------- | ------- | ----------- |
| `key` | `string` | yes      | —       | —           |

## Returns

`*FunctionResult`

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 190.
