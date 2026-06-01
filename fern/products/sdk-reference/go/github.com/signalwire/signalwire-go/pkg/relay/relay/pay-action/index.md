---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/pay-action"
title: "PayAction"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.PayAction"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go"
---
# `PayAction`

PayAction represents a long-running pay operation.

## Signature

```go
type PayAction struct
```

## Properties

| Name     | Type      | Required | Default | Description |
| -------- | --------- | -------- | ------- | ----------- |
| `Action` | `*Action` | yes      | —       | —           |

## Methods

- [`Stop`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/pay-action/stop) — Stop sends calling.pay.stop to halt the active pay operation.

## Source

[`pkg/relay/action.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go)

Line 470.
