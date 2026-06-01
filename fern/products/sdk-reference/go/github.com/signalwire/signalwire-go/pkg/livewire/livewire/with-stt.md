---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-stt"
title: "WithSTT"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.WithSTT"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `WithSTT`

WithSTT sets the STT provider — noop on SignalWire (handled by the control plane).

## Signature

```go
func WithSTT(provider string) SessionOption
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `provider` | `string` | yes      | —       | —           |

## Returns

`SessionOption`

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 379.
