---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-dial-max-duration"
title: "WithDialMaxDuration"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithDialMaxDuration"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithDialMaxDuration`

WithDialMaxDuration sets the maximum call duration in minutes. Mirrors Python's dial(max\_duration=...) parameter.

## Signature

```go
func WithDialMaxDuration(minutes int) DialOption
```

## Parameters

| Name      | Type  | Required | Default | Description |
| --------- | ----- | -------- | ------- | ----------- |
| `minutes` | `int` | yes      | —       | —           |

## Returns

`DialOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 430.
