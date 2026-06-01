---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-prompts"
title: "WithPayPrompts"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithPayPrompts"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithPayPrompts`

WithPayPrompts sets custom payment prompts.

## Signature

```go
func WithPayPrompts(prompts []map[string]any) PayOption
```

## Parameters

| Name      | Type               | Required | Default | Description |
| --------- | ------------------ | -------- | ------- | ----------- |
| `prompts` | `[]map[string]any` | yes      | —       | —           |

## Returns

`PayOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 295.
