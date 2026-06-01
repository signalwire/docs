---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/function-result/pay"
title: "Pay"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult.Pay"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig.FunctionResult"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `Pay`

Pay processes a payment using SWML pay action. connectorURL is the only required parameter. opts may be nil to use Python SDK defaults for all optional parameters.

## Signature

```go
func (*FunctionResult) Pay(connectorURL string, opts *PayOptions) *FunctionResult
```

## Parameters

| Name           | Type          | Required | Default | Description |
| -------------- | ------------- | -------- | ------- | ----------- |
| `connectorURL` | `string`      | yes      | —       | —           |
| `opts`         | `*PayOptions` | yes      | —       | —           |

## Returns

`*FunctionResult`

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 735.
