---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-message-on-completed"
title: "WithMessageOnCompleted"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithMessageOnCompleted"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithMessageOnCompleted`

WithMessageOnCompleted registers a callback invoked when the message reaches a terminal state (delivered, undelivered, or failed). The callback receives both the message and the terminal RelayEvent, mirroring Python's \_on\_completed callback contract (relay/message.py:115-117) which receives the event directly. Mirrors Python's send\_message(on\_completed=...) parameter.

## Signature

```go
func WithMessageOnCompleted(cb func(*Message, *RelayEvent)) MessageOption
```

## Parameters

| Name | Type                          | Required | Default | Description |
| ---- | ----------------------------- | -------- | ------- | ----------- |
| `cb` | `func(*Message, *RelayEvent)` | yes      | —       | —           |

## Returns

`MessageOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 474.
