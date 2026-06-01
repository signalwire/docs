---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/ai-event"
title: "AIEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.AIEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `AIEvent`

AIEvent represents a calling.call.ai event.

## Signature

```go
type AIEvent struct
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

Line 807.
