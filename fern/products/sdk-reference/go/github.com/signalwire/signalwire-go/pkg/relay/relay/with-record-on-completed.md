---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-record-on-completed"
title: "WithRecordOnCompleted"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithRecordOnCompleted"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithRecordOnCompleted`

WithRecordOnCompleted registers a callback fired when the record action reaches a terminal state. Mirrors Python's record(on\_completed=...).

## Signature

```go
func WithRecordOnCompleted(cb func(*RelayEvent)) RecordOption
```

## Parameters

| Name | Type                | Required | Default | Description |
| ---- | ------------------- | -------- | ------- | ----------- |
| `cb` | `func(*RelayEvent)` | yes      | —       | —           |

## Returns

`RecordOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 124.
