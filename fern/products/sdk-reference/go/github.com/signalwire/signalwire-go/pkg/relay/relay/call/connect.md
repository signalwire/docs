---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/connect"
title: "Connect"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.Connect"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `Connect`

Connect bridges this call to one or more devices.

## Signature

```go
func (*Call) Connect(devices [][]map[string]any, opts ...ConnectOption) error
```

## Parameters

| Name      | Type                 | Required | Default | Description |
| --------- | -------------------- | -------- | ------- | ----------- |
| `devices` | `[][]map[string]any` | yes      | —       | —           |
| `...opts` | `ConnectOption`      | no       | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 626.
