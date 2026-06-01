---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/collect-action"
title: "CollectAction"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.CollectAction"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go"
---
# `CollectAction`

CollectAction represents a play-and-collect operation.

## Signature

```go
type CollectAction struct
```

## Properties

| Name     | Type      | Required | Default | Description |
| -------- | --------- | -------- | ------- | ----------- |
| `Action` | `*Action` | yes      | —       | —           |

## Methods

- [`StartInputTimers`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/collect-action/start-input-timers) — StartInputTimers starts the initial\_timeout timer on an active collect, equivalent to Python's CollectAction.start\_input\_timers().
- [`Stop`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/collect-action/stop) — Stop sends calling.play\_and\_collect.stop to halt the play-and-collect operation.
- [`Volume`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/collect-action/volume) — Volume adjusts the playback volume by the given dB offset during a play-and-collect operation.

## Source

[`pkg/relay/action.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go)

Line 288.
