---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-connect-ringback"
title: "WithConnectRingback"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithConnectRingback"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithConnectRingback`

WithConnectRingback sets ringback media for the connect operation.

## Signature

```go
func WithConnectRingback(media []map[string]any) ConnectOption
```

## Parameters

| Name    | Type               | Required | Default | Description |
| ------- | ------------------ | -------- | ------- | ----------- |
| `media` | `[]map[string]any` | yes      | —       | —           |

## Returns

`ConnectOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 134.
