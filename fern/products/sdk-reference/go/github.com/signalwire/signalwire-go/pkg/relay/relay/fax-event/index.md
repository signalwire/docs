---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/fax-event"
title: "FaxEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.FaxEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `FaxEvent`

FaxEvent represents a calling.call.fax event.

## Signature

```go
type FaxEvent struct
```

## Properties

| Name         | Type                 | Required | Default | Description |
| ------------ | -------------------- | -------- | ------- | ----------- |
| `ControlID`  | `ControlID string`   | yes      | —       | —           |
| `Fax`        | `Fax map[string]any` | yes      | —       | —           |
| `RelayEvent` | `*RelayEvent`        | yes      | —       | —           |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 389.
