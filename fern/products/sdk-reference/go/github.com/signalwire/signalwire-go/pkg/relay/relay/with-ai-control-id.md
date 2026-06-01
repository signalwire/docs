---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-ai-control-id"
title: "WithAIControlID"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithAIControlID"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithAIControlID`

WithAIControlID supplies an explicit control\_id for the AI action, matching Python's ai(control\_id=...).

## Signature

```go
func WithAIControlID(id string) AIOption
```

## Parameters

| Name | Type     | Required | Default | Description |
| ---- | -------- | -------- | ------- | ----------- |
| `id` | `string` | yes      | —       | —           |

## Returns

`AIOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 304.
