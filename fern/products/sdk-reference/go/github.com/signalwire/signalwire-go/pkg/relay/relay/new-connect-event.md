---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-connect-event"
title: "NewConnectEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.NewConnectEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `NewConnectEvent`

NewConnectEvent constructs a ConnectEvent from raw params.

## Signature

```go
func NewConnectEvent(params map[string]any) *ConnectEvent
```

## Parameters

| Name     | Type             | Required | Default | Description |
| -------- | ---------------- | -------- | ------- | ----------- |
| `params` | `map[string]any` | yes      | —       | —           |

## Returns

`*ConnectEvent`

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 362.
