---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/tap-event"
title: "TapEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.TapEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `TapEvent`

TapEvent represents a calling.call.tap event.

## Signature

```go
type TapEvent struct
```

## Properties

| Name         | Type                    | Required | Default | Description                                                    |
| ------------ | ----------------------- | -------- | ------- | -------------------------------------------------------------- |
| `ControlID`  | `ControlID string`      | yes      | —       | —                                                              |
| `Device`     | `Device map[string]any` | yes      | —       | Device is the tap device dict, matching Python's device field. |
| `RelayEvent` | `*RelayEvent`           | yes      | —       | —                                                              |
| `State`      | `State string`          | yes      | —       | —                                                              |
| `Tap`        | `Tap map[string]any`    | yes      | —       | —                                                              |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 406.
