---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/inference-tts"
title: "InferenceTTS"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.InferenceTTS"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `InferenceTTS`

InferenceTTS is a no-op stub providing LiveKit import compatibility. SignalWire's control plane handles text-to-speech; this type exists so code written for livekit/agents inference.TTS can be dropped in unchanged.

## Signature

```go
type InferenceTTS struct
```

## Properties

| Name    | Type           | Required | Default | Description |
| ------- | -------------- | -------- | ------- | ----------- |
| `Model` | `Model string` | yes      | —       | —           |

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 944.
