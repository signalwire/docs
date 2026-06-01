---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/tap-action"
title: "TapAction"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.TapAction"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go"
---
# `TapAction`

TapAction represents a long-running tap operation.

## Signature

```go
type TapAction struct
```

## Properties

| Name     | Type      | Required | Default | Description |
| -------- | --------- | -------- | ------- | ----------- |
| `Action` | `*Action` | yes      | —       | —           |

## Methods

- [`Stop`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/tap-action/stop) — Stop sends calling.tap.stop to halt the active tap operation.

## Source

[`pkg/relay/action.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go)

Line 420.
