---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/collect-action/volume"
title: "Volume"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.CollectAction.Volume"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.CollectAction"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go"
---
# `Volume`

Volume adjusts the playback volume by the given dB offset during a play-and-collect operation.

## Signature

```go
func (*CollectAction) Volume(db float64) error
```

## Parameters

| Name | Type      | Required | Default | Description |
| ---- | --------- | -------- | ------- | ----------- |
| `db` | `float64` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/action.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go)

Line 317.
