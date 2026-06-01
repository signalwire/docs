---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/collect-event"
title: "CollectEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.CollectEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `CollectEvent`

CollectEvent represents a calling.call.collect event.

## Signature

```go
type CollectEvent struct
```

## Properties

| Name         | Type                    | Required | Default | Description                                                           |
| ------------ | ----------------------- | -------- | ------- | --------------------------------------------------------------------- |
| `ControlID`  | `ControlID string`      | yes      | —       | —                                                                     |
| `Final`      | `Final *bool`           | yes      | —       | Final is a \*bool matching Python's Optional\[bool] = None semantics. |
| `RelayEvent` | `*RelayEvent`           | yes      | —       | —                                                                     |
| `Result`     | `Result map[string]any` | yes      | —       | —                                                                     |
| `State`      | `State string`          | yes      | —       | —                                                                     |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 333.
