---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-play-on-completed"
title: "WithPlayOnCompleted"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithPlayOnCompleted"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithPlayOnCompleted`

WithPlayOnCompleted registers a callback fired when the play action reaches a terminal state. Mirrors Python's play(on\_completed=...).

## Signature

```go
func WithPlayOnCompleted(cb func(*RelayEvent)) PlayOption
```

## Parameters

| Name | Type                | Required | Default | Description |
| ---- | ------------------- | -------- | ------- | ----------- |
| `cb` | `func(*RelayEvent)` | yes      | —       | —           |

## Returns

`PlayOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 47.
