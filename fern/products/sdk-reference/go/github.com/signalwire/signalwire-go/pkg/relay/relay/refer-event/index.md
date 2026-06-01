---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/refer-event"
title: "ReferEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.ReferEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `ReferEvent`

ReferEvent represents a calling.call.refer event.

## Signature

```go
type ReferEvent struct
```

## Properties

| Name                    | Type                           | Required | Default | Description |
| ----------------------- | ------------------------------ | -------- | ------- | ----------- |
| `ControlID`             | `ControlID string`             | yes      | —       | —           |
| `RelayEvent`            | `*RelayEvent`                  | yes      | —       | —           |
| `SIPNotifyResponseCode` | `SIPNotifyResponseCode string` | yes      | —       | —           |
| `SIPReferResponseCode`  | `SIPReferResponseCode string`  | yes      | —       | —           |
| `SIPReferTo`            | `SIPReferTo string`            | yes      | —       | —           |
| `State`                 | `State string`                 | yes      | —       | —           |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 494.
