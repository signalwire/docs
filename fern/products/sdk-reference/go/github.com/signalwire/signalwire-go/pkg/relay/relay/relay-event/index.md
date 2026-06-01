---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/relay-event"
title: "RelayEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.RelayEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `RelayEvent`

RelayEvent is the base event type for all events received from the SignalWire RELAY service. It carries an event type string and a generic parameter map that can be queried via helper methods.

## Signature

```go
type RelayEvent struct
```

## Properties

| Name        | Type                    | Required | Default | Description                                                                                                         |
| ----------- | ----------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------- |
| `CallID`    | `CallID string`         | yes      | —       | CallID is the call identifier, populated from the "call\_id" wire key. Python base class always carries this field. |
| `EventType` | `EventType string`      | yes      | —       | —                                                                                                                   |
| `Params`    | `Params map[string]any` | yes      | —       | —                                                                                                                   |
| `Timestamp` | `Timestamp float64`     | yes      | —       | Timestamp is the event timestamp (float for subsecond precision), populated from the "timestamp" wire key.          |

## Methods

- [`GetBool`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/relay-event/get-bool) — GetBool returns the boolean value for a key in params, or false if missing/wrong type.
- [`GetBoolPtr`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/relay-event/get-bool-ptr) — GetBoolPtr returns a \*bool for a key in params, or nil if the key is absent. This matches Python's Optional\[bool] = None semantics.
- [`GetFloat64`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/relay-event/get-float64) — GetFloat64 returns the float64 value for a key in params, or 0.0 if missing/wrong type. This preserves subsecond precision for duration and timestamp fields.
- [`GetInt`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/relay-event/get-int) — GetInt returns the integer value for a key in params, or 0 if missing/wrong type.
- [`GetMap`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/relay-event/get-map) — GetMap returns the nested map for a key in params, or nil if missing/wrong type.
- [`GetString`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/relay-event/get-string) — GetString returns the string value for a key in params, or "" if missing/wrong type.
- [`GetStringSlice`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/relay-event/get-string-slice) — GetStringSlice returns a \[]string for a key in params whose wire value is \[]any. Returns nil if absent or wrong type. Matches Python list\[str] field behavior.

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 11.
