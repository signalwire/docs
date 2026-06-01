---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-message-tags"
title: "WithMessageTags"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithMessageTags"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithMessageTags`

WithMessageTags sets tags on the message for tracking.

## Signature

```go
func WithMessageTags(tags []string) MessageOption
```

## Parameters

| Name   | Type       | Required | Default | Description |
| ------ | ---------- | -------- | ------- | ----------- |
| `tags` | `[]string` | yes      | —       | —           |

## Returns

`MessageOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 454.
