---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/enable-extensive-data"
title: "EnableExtensiveData"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult.EnableExtensiveData"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `EnableExtensiveData`

EnableExtensiveData sends full data to LLM for this turn only.

## Signature

```go
func (*FunctionResult) EnableExtensiveData(enabled bool) *FunctionResult
```

## Parameters

| Name      | Type   | Required | Default | Description |
| --------- | ------ | -------- | ------- | ----------- |
| `enabled` | `bool` | yes      | —       | —           |

## Returns

`*FunctionResult`

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 433.
