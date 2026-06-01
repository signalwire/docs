---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/message/on"
title: "On"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Message.On"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Message"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/message.go"
---
# `On`

On registers an event handler called when message state changes.

## Signature

```go
func (*Message) On(handler func(*RelayEvent))
```

## Parameters

| Name      | Type                | Required | Default | Description |
| --------- | ------------------- | -------- | ------- | ----------- |
| `handler` | `func(*RelayEvent)` | yes      | —       | —           |

## Source

[`pkg/relay/message.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/message.go)

Line 118.
