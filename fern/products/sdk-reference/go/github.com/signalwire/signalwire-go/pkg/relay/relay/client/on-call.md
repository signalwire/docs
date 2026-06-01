---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/on-call"
title: "OnCall"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Client.OnCall"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Client"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go"
---
# `OnCall`

OnCall registers a handler invoked for each inbound call.

## Signature

```go
func (*Client) OnCall(handler func(*Call))
```

## Parameters

| Name      | Type          | Required | Default | Description |
| --------- | ------------- | -------- | ------- | ----------- |
| `handler` | `func(*Call)` | yes      | —       | —           |

## Source

[`pkg/relay/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go)

Line 84.
