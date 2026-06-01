---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/detect-event"
title: "DetectEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.DetectEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `DetectEvent`

DetectEvent represents a calling.call.detect event.

## Signature

```go
type DetectEvent struct
```

## Properties

| Name         | Type                    | Required | Default | Description |
| ------------ | ----------------------- | -------- | ------- | ----------- |
| `ControlID`  | `ControlID string`      | yes      | —       | —           |
| `Detect`     | `Detect map[string]any` | yes      | —       | —           |
| `RelayEvent` | `*RelayEvent`           | yes      | —       | —           |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 372.
