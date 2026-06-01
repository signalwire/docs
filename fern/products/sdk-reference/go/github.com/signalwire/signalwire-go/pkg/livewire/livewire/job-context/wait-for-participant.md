---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/job-context/wait-for-participant"
title: "WaitForParticipant"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.JobContext.WaitForParticipant"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire.JobContext"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `WaitForParticipant`

WaitForParticipant is a LiveKit compatibility noop — SignalWire handles participant management automatically. Mirrors Python JobContext.wait\_for\_participant(\*, identity=None) (line 670).

## Signature

```go
func (*JobContext) WaitForParticipant(identity string) error
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `identity` | `string` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 726.
