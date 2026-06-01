---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/calling-error-event"
title: "CallingErrorEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.CallingErrorEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `CallingErrorEvent`

CallingErrorEvent represents a calling.call.error event.

## Signature

```go
type CallingErrorEvent struct
```

## Properties

| Name          | Type                 | Required | Default | Description |
| ------------- | -------------------- | -------- | ------- | ----------- |
| `Code`        | `Code string`        | yes      | —       | —           |
| `Description` | `Description string` | yes      | —       | —           |
| `Message`     | `Message string`     | yes      | —       | —           |
| `RelayEvent`  | `*RelayEvent`        | yes      | —       | —           |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 674.
