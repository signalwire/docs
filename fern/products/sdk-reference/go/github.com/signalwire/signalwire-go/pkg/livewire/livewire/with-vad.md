---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-vad"
title: "WithVAD"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.WithVAD"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `WithVAD`

WithVAD sets the VAD provider — noop on SignalWire (handled by the control plane).

## Signature

```go
func WithVAD(vad any) SessionOption
```

## Parameters

| Name  | Type  | Required | Default | Description |
| ----- | ----- | -------- | ------- | ----------- |
| `vad` | `any` | yes      | —       | —           |

## Returns

`SessionOption`

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 402.
