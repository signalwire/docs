---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/live-server/set-setup-func"
title: "SetSetupFunc"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.LiveServer.SetSetupFunc"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire.LiveServer"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `SetSetupFunc`

SetSetupFunc sets the prewarm/setup function — noop on SignalWire.

## Signature

```go
func (*LiveServer) SetSetupFunc(fn func(*JobProcess))
```

## Parameters

| Name | Type                | Required | Default | Description |
| ---- | ------------------- | -------- | ------- | ----------- |
| `fn` | `func(*JobProcess)` | yes      | —       | —           |

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 801.
