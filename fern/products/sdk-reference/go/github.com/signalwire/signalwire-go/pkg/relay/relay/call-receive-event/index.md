---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call-receive-event"
title: "CallReceiveEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.CallReceiveEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `CallReceiveEvent`

CallReceiveEvent represents a calling.call.receive event for inbound calls.

## Signature

```go
type CallReceiveEvent struct
```

## Properties

| Name         | Type                    | Required | Default | Description |
| ------------ | ----------------------- | -------- | ------- | ----------- |
| `CallID`     | `CallID string`         | yes      | —       | —           |
| `CallState`  | `CallState string`      | yes      | —       | —           |
| `Context`    | `Context string`        | yes      | —       | —           |
| `Device`     | `Device map[string]any` | yes      | —       | —           |
| `Direction`  | `Direction string`      | yes      | —       | —           |
| `NodeID`     | `NodeID string`         | yes      | —       | —           |
| `ProjectID`  | `ProjectID string`      | yes      | —       | —           |
| `RelayEvent` | `*RelayEvent`           | yes      | —       | —           |
| `SegmentID`  | `SegmentID string`      | yes      | —       | —           |
| `Tag`        | `Tag string`            | yes      | —       | —           |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 226.
