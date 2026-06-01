---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/join-room"
title: "JoinRoom"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.JoinRoom"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `JoinRoom`

JoinRoom joins the call to a named room. statusURL is optional (empty string omits it), matching Python's join\_room(name, \*, status\_url).

## Signature

```go
func (*Call) JoinRoom(name string, statusURL string) error
```

## Parameters

| Name        | Type     | Required | Default | Description |
| ----------- | -------- | -------- | ------- | ----------- |
| `name`      | `string` | yes      | —       | —           |
| `statusURL` | `string` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 1052.
