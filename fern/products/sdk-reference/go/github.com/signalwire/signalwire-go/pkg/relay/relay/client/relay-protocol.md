---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/client/relay-protocol"
title: "RelayProtocol"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Client.RelayProtocol"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Client"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go"
---
# `RelayProtocol`

RelayProtocol returns the server-assigned protocol string received during authentication. Mirrors Python's relay\_protocol property. The value is empty until after a successful Connect/Run.

## Signature

```go
func (*Client) RelayProtocol() string
```

## Returns

`string`

## Source

[`pkg/relay/client.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/client.go)

Line 112.
