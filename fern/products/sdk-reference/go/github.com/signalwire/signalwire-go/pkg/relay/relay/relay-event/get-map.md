---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/relay-event/get-map"
title: "GetMap"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.RelayEvent.GetMap"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.RelayEvent"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `GetMap`

GetMap returns the nested map for a key in params, or nil if missing/wrong type.

## Signature

```go
func (*RelayEvent) GetMap(key string) map[string]any
```

## Parameters

| Name  | Type     | Required | Default | Description |
| ----- | -------- | -------- | ------- | ----------- |
| `key` | `string` | yes      | —       | —           |

## Returns

`map[string]any`

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 156.
