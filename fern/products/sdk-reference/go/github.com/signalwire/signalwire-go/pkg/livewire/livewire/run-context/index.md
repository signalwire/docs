---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/run-context"
title: "RunContext"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.RunContext"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `RunContext`

RunContext mirrors a LiveKit RunContext — available inside tool handlers.

## Signature

```go
type RunContext struct
```

## Properties

| Name           | Type                    | Required | Default | Description |
| -------------- | ----------------------- | -------- | ------- | ----------- |
| `Agent`        | `Agent *Agent`          | yes      | —       | —           |
| `FunctionCall` | `FunctionCall any`      | yes      | —       | —           |
| `Session`      | `Session *AgentSession` | yes      | —       | —           |
| `SpeechHandle` | `SpeechHandle any`      | yes      | —       | —           |
| `Userdata`     | `Userdata any`          | yes      | —       | —           |

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 316.
