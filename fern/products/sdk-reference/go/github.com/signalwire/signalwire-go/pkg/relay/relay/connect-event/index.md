---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/connect-event"
title: "ConnectEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.ConnectEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `ConnectEvent`

ConnectEvent represents a calling.call.connect event.

## Signature

```go
type ConnectEvent struct
```

## Properties

| Name           | Type                  | Required | Default | Description |
| -------------- | --------------------- | -------- | ------- | ----------- |
| `ConnectState` | `ConnectState string` | yes      | —       | —           |
| `Peer`         | `Peer map[string]any` | yes      | —       | —           |
| `RelayEvent`   | `*RelayEvent`         | yes      | —       | —           |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 355.
