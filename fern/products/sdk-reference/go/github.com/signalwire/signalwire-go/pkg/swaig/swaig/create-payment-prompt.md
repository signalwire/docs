---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/swaig/swaig/create-payment-prompt"
title: "CreatePaymentPrompt"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/swaig.CreatePaymentPrompt"
  parent: "github.com/signalwire/signalwire-go/pkg/swaig"
  module: "github.com.signalwire.signalwire-go.pkg.swaig"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go"
---
# `CreatePaymentPrompt`

CreatePaymentPrompt creates a payment prompt configuration. cardType and errorType are optional; pass empty strings to omit them. This matches the Python SDK's create\_payment\_prompt() static method signature.

## Signature

```go
func CreatePaymentPrompt(
	forSituation string,
	actions []map[string]string,
	cardType string,
	errorType string
) map[string]any
```

## Parameters

| Name           | Type                  | Required | Default | Description |
| -------------- | --------------------- | -------- | ------- | ----------- |
| `forSituation` | `string`              | yes      | —       | —           |
| `actions`      | `[]map[string]string` | yes      | —       | —           |
| `cardType`     | `string`              | yes      | —       | —           |
| `errorType`    | `string`              | yes      | —       | —           |

## Returns

`map[string]any`

## Source

[`pkg/swaig/function_result.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/swaig/function_result.go)

Line 942.
