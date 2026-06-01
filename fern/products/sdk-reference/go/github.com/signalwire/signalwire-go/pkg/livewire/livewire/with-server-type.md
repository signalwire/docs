---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/livewire/livewire/with-server-type"
title: "WithServerType"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/livewire.WithServerType"
  parent: "github.com/signalwire/signalwire-go/pkg/livewire"
  module: "github.com.signalwire.signalwire-go.pkg.livewire"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go"
---
# `WithServerType`

WithServerType sets the server type ("room" or "publisher") — noop on SignalWire.

## Signature

```go
func WithServerType(t string) RTCOption
```

## Parameters

| Name | Type     | Required | Default | Description |
| ---- | -------- | -------- | ------- | ----------- |
| `t`  | `string` | yes      | —       | —           |

## Returns

`RTCOption`

## Source

[`pkg/livewire/livewire.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/livewire/livewire.go)

Line 775.
