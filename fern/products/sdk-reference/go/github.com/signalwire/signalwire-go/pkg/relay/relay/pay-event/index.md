---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/pay-event"
title: "PayEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.PayEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `PayEvent`

PayEvent represents a calling.call.pay event.

## Signature

```go
type PayEvent struct
```

## Properties

| Name         | Type                    | Required | Default | Description |
| ------------ | ----------------------- | -------- | ------- | ----------- |
| `ControlID`  | `ControlID string`      | yes      | —       | —           |
| `RelayEvent` | `*RelayEvent`           | yes      | —       | —           |
| `Result`     | `Result map[string]any` | yes      | —       | —           |
| `State`      | `State string`          | yes      | —       | —           |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 537.
