---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/relay-event/get-string"
title: "GetString"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.RelayEvent.GetString"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.RelayEvent"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `GetString`

GetString returns the string value for a key in params, or "" if missing/wrong type.

## Signature

```go
func (*RelayEvent) GetString(key string) string
```

## Parameters

| Name  | Type     | Required | Default | Description |
| ----- | -------- | -------- | ------- | ----------- |
| `key` | `string` | yes      | —       | —           |

## Returns

`string`

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 37.
