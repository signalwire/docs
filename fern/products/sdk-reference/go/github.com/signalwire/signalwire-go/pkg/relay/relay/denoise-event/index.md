---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/denoise-event"
title: "DenoiseEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.DenoiseEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go"
---
# `DenoiseEvent`

DenoiseEvent represents a calling.call.denoise event.

## Signature

```go
type DenoiseEvent struct
```

## Properties

| Name         | Type               | Required | Default | Description                                    |
| ------------ | ------------------ | -------- | ------- | ---------------------------------------------- |
| `ControlID`  | `ControlID string` | yes      | —       | —                                              |
| `Denoised`   | `Denoised bool`    | yes      | —       | Denoised matches Python's denoised bool field. |
| `RelayEvent` | `*RelayEvent`      | yes      | —       | —                                              |
| `State`      | `State string`     | yes      | —       | —                                              |

## Source

[`pkg/relay/event.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/event.go)

Line 517.
