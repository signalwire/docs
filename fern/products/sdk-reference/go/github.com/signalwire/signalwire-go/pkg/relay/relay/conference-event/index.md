---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/conference-event"
title: "ConferenceEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.ConferenceEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `ConferenceEvent`

ConferenceEvent represents a calling.call.conference event.

## Signature

```go
type ConferenceEvent struct
```

## Properties

| Name           | Type                  | Required | Default | Description                                                                                                                        |
| -------------- | --------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `ConferenceID` | `ConferenceID string` | yes      | —       | —                                                                                                                                  |
| `ControlID`    | `ControlID string`    | yes      | —       | —                                                                                                                                  |
| `Name`         | `Name string`         | yes      | —       | —                                                                                                                                  |
| `RelayEvent`   | `*RelayEvent`         | yes      | —       | —                                                                                                                                  |
| `Status`       | `Status string`       | yes      | —       | Status reads wire key "status" matching Python's status field. (Replaces the previous State field which incorrectly read "state".) |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 651.
