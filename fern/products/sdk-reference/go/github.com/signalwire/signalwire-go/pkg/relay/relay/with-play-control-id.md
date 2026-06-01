---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/with-play-control-id"
title: "WithPlayControlID"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.WithPlayControlID"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go"
---
# `WithPlayControlID`

WithPlayControlID sets an explicit control\_id for the play action. Mirrors Python's play(control\_id=...). When omitted the SDK auto-generates a UUID. The same key is honored by play\_and\_collect.

## Signature

```go
func WithPlayControlID(id string) PlayOption
```

## Parameters

| Name | Type     | Required | Default | Description |
| ---- | -------- | -------- | ------- | ----------- |
| `id` | `string` | yes      | —       | —           |

## Returns

`PlayOption`

## Source

[`pkg/relay/options.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/options.go)

Line 25.
