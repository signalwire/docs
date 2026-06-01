---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/standalone-collect-action"
title: "StandaloneCollectAction"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.StandaloneCollectAction"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go"
---
# `StandaloneCollectAction`

StandaloneCollectAction represents a standalone collect (without play).

## Signature

```go
type StandaloneCollectAction struct
```

## Properties

| Name     | Type      | Required | Default | Description |
| -------- | --------- | -------- | ------- | ----------- |
| `Action` | `*Action` | yes      | —       | —           |

## Methods

- [`StartInputTimers`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/standalone-collect-action/start-input-timers) — StartInputTimers starts the initial\_timeout timer on an active standalone collect, equivalent to Python's StandaloneCollectAction.start\_input\_timers().
- [`Stop`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/standalone-collect-action/stop) — Stop sends calling.collect.stop to halt the standalone collect operation.

## Source

[`pkg/relay/action.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go)

Line 345.
