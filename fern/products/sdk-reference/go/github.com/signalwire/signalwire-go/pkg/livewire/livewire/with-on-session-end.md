---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-on-session-end"
title: "WithOnSessionEnd"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.WithOnSessionEnd"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `WithOnSessionEnd`

WithOnSessionEnd accepts a session-end callback — noop on SignalWire. Mirrors Python AgentServer.rtc\_session(on\_session\_end=...) which silently ignores the parameter for LiveKit portability.

## Signature

```go
func WithOnSessionEnd(fn func()) RTCOption
```

## Parameters

| Name | Type     | Required | Default | Description |
| ---- | -------- | -------- | ------- | ----------- |
| `fn` | `func()` | yes      | —       | —           |

## Returns

`RTCOption`

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 794.
