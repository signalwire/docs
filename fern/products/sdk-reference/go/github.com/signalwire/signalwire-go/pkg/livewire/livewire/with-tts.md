---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-tts"
title: "WithTTS"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.WithTTS"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `WithTTS`

WithTTS sets the TTS provider — noop on SignalWire (voice can be configured via languages).

## Signature

```go
func WithTTS(provider string) SessionOption
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `provider` | `string` | yes      | —       | —           |

## Returns

`SessionOption`

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 387.
