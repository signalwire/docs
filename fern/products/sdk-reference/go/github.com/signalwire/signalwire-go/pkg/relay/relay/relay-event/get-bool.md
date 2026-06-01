---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/relay-event/get-bool"
title: "GetBool"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.RelayEvent.GetBool"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.RelayEvent"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `GetBool`

GetBool returns the boolean value for a key in params, or false if missing/wrong type.

## Signature

```go
func (*RelayEvent) GetBool(key string) bool
```

## Parameters

| Name  | Type     | Required | Default | Description |
| ----- | -------- | -------- | ------- | ----------- |
| `key` | `string` | yes      | —       | —           |

## Returns

`bool`

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 107.
