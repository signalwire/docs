---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-timeout"
title: "WithPayTimeout"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithPayTimeout"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithPayTimeout`

WithPayTimeout sets the timeout string for the payment session.

## Signature

```go
func WithPayTimeout(timeout string) PayOption
```

## Parameters

| Name      | Type     | Required | Default | Description |
| --------- | -------- | -------- | ------- | ----------- |
| `timeout` | `string` | yes      | —       | —           |

## Returns

`PayOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 230.
