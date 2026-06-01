---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-parameters"
title: "WithPayParameters"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithPayParameters"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithPayParameters`

WithPayParameters sets additional payment parameters.

## Signature

```go
func WithPayParameters(parameters []map[string]any) PayOption
```

## Parameters

| Name         | Type               | Required | Default | Description |
| ------------ | ------------------ | -------- | ------- | ----------- |
| `parameters` | `[]map[string]any` | yes      | —       | —           |

## Returns

`PayOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 290.
