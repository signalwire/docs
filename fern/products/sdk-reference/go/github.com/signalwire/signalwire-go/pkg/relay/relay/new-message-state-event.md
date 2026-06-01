---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-message-state-event"
title: "NewMessageStateEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.NewMessageStateEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `NewMessageStateEvent`

NewMessageStateEvent constructs a MessageStateEvent from raw params.

## Signature

```go
func NewMessageStateEvent(params map[string]any) *MessageStateEvent
```

## Parameters

| Name     | Type             | Required | Default | Description |
| -------- | ---------------- | -------- | ------- | ----------- |
| `params` | `map[string]any` | yes      | —       | —           |

## Returns

`*MessageStateEvent`

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 769.
