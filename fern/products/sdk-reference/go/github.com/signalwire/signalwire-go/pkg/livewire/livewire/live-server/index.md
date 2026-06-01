---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/live-server"
title: "LiveServer"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.LiveServer"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `LiveServer`

LiveServer mirrors a LiveKit AgentServer — it registers entrypoints and starts the agent.

## Signature

```go
type LiveServer struct
```

## Methods

- [`RTCSession`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/live-server/rtc-session) — RTCSession registers the session entrypoint function.
- [`SetSetupFunc`](/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/live-server/set-setup-func) — SetSetupFunc sets the prewarm/setup function — noop on SignalWire.

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 746.
