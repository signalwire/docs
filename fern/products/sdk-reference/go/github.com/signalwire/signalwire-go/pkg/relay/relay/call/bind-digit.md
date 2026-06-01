---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/bind-digit"
title: "BindDigit"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.BindDigit"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `BindDigit`

BindDigit binds a DTMF digit sequence to trigger a RELAY method. bindParams, realm, and maxTriggers are optional (nil/zero-value omits them), matching Python's bind\_digit(digits, bind\_method, \*, bind\_params, realm, max\_triggers).

## Signature

```go
func (*Call) BindDigit(
	digits string,
	method string,
	bindParams map[string]any,
	realm string,
	maxTriggers int
) error
```

## Parameters

| Name          | Type             | Required | Default | Description |
| ------------- | ---------------- | -------- | ------- | ----------- |
| `digits`      | `string`         | yes      | —       | —           |
| `method`      | `string`         | yes      | —       | —           |
| `bindParams`  | `map[string]any` | yes      | —       | —           |
| `realm`       | `string`         | yes      | —       | —           |
| `maxTriggers` | `int`            | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 1120.
