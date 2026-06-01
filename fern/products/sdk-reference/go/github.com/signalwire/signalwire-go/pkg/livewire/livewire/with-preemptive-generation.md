---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-preemptive-generation"
title: "WithPreemptiveGeneration"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.WithPreemptiveGeneration"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `WithPreemptiveGeneration`

WithPreemptiveGeneration enables or disables preemptive generation — noop on SignalWire. Mirrors Python AgentSession(preemptive\_generation=False) (line 423).

## Signature

```go
func WithPreemptiveGeneration(enabled bool) SessionOption
```

## Parameters

| Name      | Type   | Required | Default | Description |
| --------- | ------ | -------- | ------- | ----------- |
| `enabled` | `bool` | yes      | —       | —           |

## Returns

`SessionOption`

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 485.
