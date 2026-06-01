---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-message-media"
title: "WithMessageMedia"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithMessageMedia"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithMessageMedia`

WithMessageMedia adds media URLs to the message (MMS).

## Signature

```go
func WithMessageMedia(urls []string) MessageOption
```

## Parameters

| Name   | Type       | Required | Default | Description |
| ------ | ---------- | -------- | ------- | ----------- |
| `urls` | `[]string` | yes      | —       | —           |

## Returns

`MessageOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 440.
