---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/unreceive"
title: "Unreceive"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Client.Unreceive"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Client"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go"
---
# `Unreceive`

Unreceive unsubscribes from contexts for inbound events. Sends signalwire.unreceive on the assigned protocol. Mirrors Python's async unreceive(contexts).

## Signature

```go
func (*Client) Unreceive(contexts ...string) error
```

## Parameters

| Name          | Type     | Required | Default | Description |
| ------------- | -------- | -------- | ------- | ----------- |
| `...contexts` | `string` | no       | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go)

Line 220.
