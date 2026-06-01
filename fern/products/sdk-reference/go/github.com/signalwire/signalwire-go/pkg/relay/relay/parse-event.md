---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/parse-event"
title: "ParseEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.ParseEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `ParseEvent`

ParseEvent parses a raw signalwire event payload dict into a typed event object. It reads "event\_type" from the top-level payload and "params" as the inner parameter map, then dispatches to the appropriate typed constructor. If the event\_type is not recognised, a plain \*RelayEvent is returned. Callers can type-assert or type-switch on the result to access the concrete event fields.

This mirrors Python's relay.event.parse\_event(payload).

## Signature

```go
func ParseEvent(payload map[string]any) any
```

## Parameters

| Name      | Type             | Required | Default | Description |
| --------- | ---------------- | -------- | ------- | ----------- |
| `payload` | `map[string]any` | yes      | —       | —           |

## Returns

`any`

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 833.
