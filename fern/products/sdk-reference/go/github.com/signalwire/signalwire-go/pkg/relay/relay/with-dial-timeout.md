---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-dial-timeout"
title: "WithDialTimeout"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithDialTimeout"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithDialTimeout`

WithDialTimeout sets the legacy per-leg dial timeout in seconds. (Was the only Go option; retained for back-compat. To bound the overall Dial() call use WithDialClientTimeout.)

## Signature

```go
func WithDialTimeout(t int) DialOption
```

## Parameters

| Name | Type  | Required | Default | Description |
| ---- | ----- | -------- | ------- | ----------- |
| `t`  | `int` | yes      | —       | —           |

## Returns

`DialOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 400.
