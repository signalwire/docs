---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message-state-event"
title: "MessageStateEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.MessageStateEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `MessageStateEvent`

MessageStateEvent represents a messaging.state event.

## Signature

```go
type MessageStateEvent struct
```

## Properties

| Name           | Type                  | Required | Default | Description                                                                                                                                              |
| -------------- | --------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Body`         | `Body string`         | yes      | —       | Body matches Python's body field.                                                                                                                        |
| `Context`      | `Context string`      | yes      | —       | Context matches Python's context field.                                                                                                                  |
| `Direction`    | `Direction string`    | yes      | —       | —                                                                                                                                                        |
| `FromNumber`   | `FromNumber string`   | yes      | —       | —                                                                                                                                                        |
| `Media`        | `Media []string`      | yes      | —       | Media matches Python's media: list\[str] field.                                                                                                          |
| `MessageID`    | `MessageID string`    | yes      | —       | —                                                                                                                                                        |
| `MessageState` | `MessageState string` | yes      | —       | MessageState reads wire key "message\_state" matching Python's message\_state field. (Replaces the previous State field which incorrectly read "state".) |
| `Reason`       | `Reason string`       | yes      | —       | —                                                                                                                                                        |
| `RelayEvent`   | `*RelayEvent`         | yes      | —       | —                                                                                                                                                        |
| `Segments`     | `Segments int`        | yes      | —       | Segments matches Python's segments: int field.                                                                                                           |
| `Tags`         | `Tags []string`       | yes      | —       | Tags matches Python's tags: list\[str] field.                                                                                                            |
| `ToNumber`     | `ToNumber string`     | yes      | —       | —                                                                                                                                                        |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 746.
