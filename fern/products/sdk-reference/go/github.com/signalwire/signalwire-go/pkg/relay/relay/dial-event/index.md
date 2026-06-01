---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/dial-event"
title: "DialEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.DialEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `DialEvent`

DialEvent represents a calling.call.dial event.

## Signature

```go
type DialEvent struct
```

## Properties

| Name         | Type                  | Required | Default | Description                                                                                                                                     |
| ------------ | --------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `Call`       | `Call map[string]any` | yes      | —       | Call is the nested call dict, matching Python's call field.                                                                                     |
| `CallID`     | `CallID string`       | yes      | —       | —                                                                                                                                               |
| `DialState`  | `DialState string`    | yes      | —       | DialState reads wire key "dial\_state" matching Python's dial\_state field. (Replaces the previous State field which incorrectly read "state".) |
| `NodeID`     | `NodeID string`       | yes      | —       | —                                                                                                                                               |
| `RelayEvent` | `*RelayEvent`         | yes      | —       | —                                                                                                                                               |
| `Tag`        | `Tag string`          | yes      | —       | —                                                                                                                                               |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 468.
