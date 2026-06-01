---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/send-digits"
title: "SendDigits"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.SendDigits"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `SendDigits`

SendDigits sends DTMF digits on the call.

## Signature

```go
func (*Call) SendDigits(digits string) error
```

## Parameters

| Name     | Type     | Required | Default | Description |
| -------- | -------- | -------- | ------- | ----------- |
| `digits` | `string` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 653.
