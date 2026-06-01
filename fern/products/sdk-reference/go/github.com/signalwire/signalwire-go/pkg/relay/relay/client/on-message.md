---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/on-message"
title: "OnMessage"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Client.OnMessage"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Client"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go"
---
# `OnMessage`

OnMessage registers a handler invoked for each inbound message.

## Signature

```go
func (*Client) OnMessage(handler func(*Message))
```

## Parameters

| Name      | Type             | Required | Default | Description |
| --------- | ---------------- | -------- | ------- | ----------- |
| `handler` | `func(*Message)` | yes      | —       | —           |

## Source

[`pkg/relay/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go)

Line 91.
