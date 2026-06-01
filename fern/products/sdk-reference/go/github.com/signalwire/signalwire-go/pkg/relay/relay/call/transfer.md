---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/transfer"
title: "Transfer"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.Transfer"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `Transfer`

Transfer transfers call control to another RELAY app or SWML script. The dest parameter is the destination context/URL string, sent as the "dest" key to the server (matches Python's transfer(dest: str) behavior).

## Signature

```go
func (*Call) Transfer(dest string) error
```

## Parameters

| Name   | Type     | Required | Default | Description |
| ------ | -------- | -------- | ------- | ----------- |
| `dest` | `string` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 283.
