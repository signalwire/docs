---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-dial-event"
title: "NewDialEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.NewDialEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `NewDialEvent`

NewDialEvent constructs a DialEvent from raw params.

## Signature

```go
func NewDialEvent(params map[string]any) *DialEvent
```

## Parameters

| Name     | Type             | Required | Default | Description |
| -------- | ---------------- | -------- | ------- | ----------- |
| `params` | `map[string]any` | yes      | —       | —           |

## Returns

`*DialEvent`

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 481.
