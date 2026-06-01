---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/record-event"
title: "RecordEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.RecordEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `RecordEvent`

RecordEvent represents a calling.call.record event.

## Signature

```go
type RecordEvent struct
```

## Properties

| Name         | Type                    | Required | Default | Description                                                                                 |
| ------------ | ----------------------- | -------- | ------- | ------------------------------------------------------------------------------------------- |
| `ControlID`  | `ControlID string`      | yes      | —       | —                                                                                           |
| `Duration`   | `Duration float64`      | yes      | —       | Duration is float64 (matching Python's float) to preserve subsecond precision.              |
| `Record`     | `Record map[string]any` | yes      | —       | Record is the raw nested record dict from the wire payload, matching Python's record field. |
| `RelayEvent` | `*RelayEvent`           | yes      | —       | —                                                                                           |
| `Size`       | `Size int`              | yes      | —       | —                                                                                           |
| `State`      | `State string`          | yes      | —       | —                                                                                           |
| `URL`        | `URL string`            | yes      | —       | —                                                                                           |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 284.
