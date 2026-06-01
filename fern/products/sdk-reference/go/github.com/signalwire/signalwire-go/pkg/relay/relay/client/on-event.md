---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/on-event"
title: "OnEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Client.OnEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Client"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go"
---
# `OnEvent`

OnEvent registers a handler invoked for every inbound `signalwire.event` frame, AFTER type-specific routing (call, messaging) has run. The handler receives the raw event\_type string and params map. This is the lowest-level event hook — most callers should use OnCall or OnMessage instead. Mirrors Python RelayClient's public event-tap surface used by integration tests.

## Signature

```go
func (*Client) OnEvent(handler func(eventType string, params map[string]any))
```

## Parameters

| Name      | Type                                            | Required | Default | Description |
| --------- | ----------------------------------------------- | -------- | ------- | ----------- |
| `handler` | `func(eventType string, params map[string]any)` | yes      | —       | —           |

## Source

[`pkg/relay/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go)

Line 103.
