---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/new-relay-event"
title: "NewRelayEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.NewRelayEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `NewRelayEvent`

NewRelayEvent creates a new RelayEvent from the given type and params.

## Signature

```go
func NewRelayEvent(eventType string, params map[string]any) *RelayEvent
```

## Parameters

| Name        | Type             | Required | Default | Description |
| ----------- | ---------------- | -------- | ------- | ----------- |
| `eventType` | `string`         | yes      | —       | —           |
| `params`    | `map[string]any` | yes      | —       | —           |

## Returns

`*RelayEvent`

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 23.
