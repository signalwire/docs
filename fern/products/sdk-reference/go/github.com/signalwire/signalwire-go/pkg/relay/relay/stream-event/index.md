---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/stream-event"
title: "StreamEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.StreamEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `StreamEvent`

StreamEvent represents a calling.call.stream event.

## Signature

```go
type StreamEvent struct
```

## Properties

| Name         | Type               | Required | Default | Description                                            |
| ------------ | ------------------ | -------- | ------- | ------------------------------------------------------ |
| `ControlID`  | `ControlID string` | yes      | —       | —                                                      |
| `Name`       | `Name string`      | yes      | —       | Name is the stream name, matching Python's name field. |
| `RelayEvent` | `*RelayEvent`      | yes      | —       | —                                                      |
| `State`      | `State string`     | yes      | —       | —                                                      |
| `URL`        | `URL string`       | yes      | —       | URL is the stream URL, matching Python's url field.    |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 428.
