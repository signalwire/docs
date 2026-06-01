---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call-state-event"
title: "CallStateEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.CallStateEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `CallStateEvent`

CallStateEvent represents a calling.call.state event.

## Signature

```go
type CallStateEvent struct
```

## Properties

| Name         | Type                    | Required | Default | Description |
| ------------ | ----------------------- | -------- | ------- | ----------- |
| `CallID`     | `CallID string`         | yes      | —       | —           |
| `CallState`  | `CallState string`      | yes      | —       | —           |
| `Device`     | `Device map[string]any` | yes      | —       | —           |
| `Direction`  | `Direction string`      | yes      | —       | —           |
| `EndReason`  | `EndReason string`      | yes      | —       | —           |
| `NodeID`     | `NodeID string`         | yes      | —       | —           |
| `RelayEvent` | `*RelayEvent`           | yes      | —       | —           |
| `Tag`        | `Tag string`            | yes      | —       | —           |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 199.
