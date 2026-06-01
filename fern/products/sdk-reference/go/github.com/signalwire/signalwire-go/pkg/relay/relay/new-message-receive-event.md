---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-message-receive-event"
title: "NewMessageReceiveEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.NewMessageReceiveEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `NewMessageReceiveEvent`

NewMessageReceiveEvent constructs a MessageReceiveEvent from raw params.

## Signature

```go
func NewMessageReceiveEvent(params map[string]any) *MessageReceiveEvent
```

## Parameters

| Name     | Type             | Required | Default | Description |
| -------- | ---------------- | -------- | ------- | ----------- |
| `params` | `map[string]any` | yes      | —       | —           |

## Returns

`*MessageReceiveEvent`

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 709.
