---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/create-payment-action"
title: "CreatePaymentAction"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.CreatePaymentAction"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `CreatePaymentAction`

CreatePaymentAction creates a single payment action entry.

## Signature

```go
func CreatePaymentAction(actionType string, phrase string) map[string]string
```

## Parameters

| Name         | Type     | Required | Default | Description |
| ------------ | -------- | -------- | ------- | ----------- |
| `actionType` | `string` | yes      | —       | —           |
| `phrase`     | `string` | yes      | —       | —           |

## Returns

`map[string]string`

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 957.
