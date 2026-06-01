---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/live-server/rtc-session"
title: "RTCSession"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.LiveServer.RTCSession"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire.LiveServer"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `RTCSession`

RTCSession registers the session entrypoint function.

## Signature

```go
func (*LiveServer) RTCSession(fn func(*JobContext), opts ...RTCOption)
```

## Parameters

| Name      | Type                | Required | Default | Description |
| --------- | ------------------- | -------- | ------- | ----------- |
| `fn`      | `func(*JobContext)` | yes      | —       | —           |
| `...opts` | `RTCOption`         | no       | —       | —           |

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 807.
