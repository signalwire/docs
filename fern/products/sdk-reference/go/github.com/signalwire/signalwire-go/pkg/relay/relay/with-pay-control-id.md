---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-pay-control-id"
title: "WithPayControlID"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithPayControlID"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithPayControlID`

WithPayControlID supplies an explicit control\_id for the pay action, matching Python's pay(control\_id=...).

## Signature

```go
func WithPayControlID(id string) PayOption
```

## Parameters

| Name | Type     | Required | Default | Description |
| ---- | -------- | -------- | ------- | ----------- |
| `id` | `string` | yes      | —       | —           |

## Returns

`PayOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 210.
