---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/play-action/volume"
title: "Volume"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.PlayAction.Volume"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.PlayAction"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go"
---
# `Volume`

Volume adjusts playback volume by the given dB offset.

## Signature

```go
func (*PlayAction) Volume(db float64) error
```

## Parameters

| Name | Type      | Required | Default | Description |
| ---- | --------- | -------- | ------- | ----------- |
| `db` | `float64` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/action.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go)

Line 184.
