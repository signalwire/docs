---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/stream"
title: "Stream"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.Stream"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `Stream`

Stream starts streaming call audio to a WebSocket URL. Use WithStreamControlID for an explicit control\_id (matches Python's stream(control\_id=...)).

## Signature

```go
func (*Call) Stream(url string, opts ...StreamOption) *StreamAction
```

## Parameters

| Name      | Type           | Required | Default | Description |
| --------- | -------------- | -------- | ------- | ----------- |
| `url`     | `string`       | yes      | —       | —           |
| `...opts` | `StreamOption` | no       | —       | —           |

## Returns

`*StreamAction`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 831.
