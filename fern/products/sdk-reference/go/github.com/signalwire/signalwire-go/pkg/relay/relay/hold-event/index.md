---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/hold-event"
title: "HoldEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.HoldEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `HoldEvent`

HoldEvent represents a calling.call.hold event.

## Signature

```go
type HoldEvent struct
```

## Properties

| Name         | Type               | Required | Default | Description |
| ------------ | ------------------ | -------- | ------- | ----------- |
| `ControlID`  | `ControlID string` | yes      | —       | —           |
| `RelayEvent` | `*RelayEvent`      | yes      | —       | —           |
| `State`      | `State string`     | yes      | —       | —           |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 634.
