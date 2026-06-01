---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message-receive-event"
title: "MessageReceiveEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.MessageReceiveEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `MessageReceiveEvent`

MessageReceiveEvent represents a messaging.receive event.

## Signature

```go
type MessageReceiveEvent struct
```

## Properties

| Name           | Type                  | Required | Default | Description                                         |
| -------------- | --------------------- | -------- | ------- | --------------------------------------------------- |
| `Body`         | `Body string`         | yes      | —       | —                                                   |
| `Context`      | `Context string`      | yes      | —       | —                                                   |
| `Direction`    | `Direction string`    | yes      | —       | —                                                   |
| `FromNumber`   | `FromNumber string`   | yes      | —       | —                                                   |
| `Media`        | `Media []string`      | yes      | —       | —                                                   |
| `MessageID`    | `MessageID string`    | yes      | —       | —                                                   |
| `MessageState` | `MessageState string` | yes      | —       | MessageState matches Python's message\_state field. |
| `RelayEvent`   | `*RelayEvent`         | yes      | —       | —                                                   |
| `Segments`     | `Segments int`        | yes      | —       | —                                                   |
| `Tags`         | `Tags []string`       | yes      | —       | —                                                   |
| `ToNumber`     | `ToNumber string`     | yes      | —       | —                                                   |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 693.
