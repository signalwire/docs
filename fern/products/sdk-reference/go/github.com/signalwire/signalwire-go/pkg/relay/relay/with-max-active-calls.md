---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-max-active-calls"
title: "WithMaxActiveCalls"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithMaxActiveCalls"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithMaxActiveCalls`

WithMaxActiveCalls limits the number of concurrent active calls.

## Signature

```go
func WithMaxActiveCalls(n int) ClientOption
```

## Parameters

| Name | Type  | Required | Default | Description |
| ---- | ----- | -------- | ------- | ----------- |
| `n`  | `int` | yes      | —       | —           |

## Returns

`ClientOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 381.
