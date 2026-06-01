---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/ai-action"
title: "AIAction"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.AIAction"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go"
---
# `AIAction`

AIAction represents a long-running AI operation on a call.

## Signature

```go
type AIAction struct
```

## Properties

| Name     | Type      | Required | Default | Description |
| -------- | --------- | -------- | ------- | ----------- |
| `Action` | `*Action` | yes      | —       | —           |

## Methods

- [`Stop`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/ai-action/stop) — Stop sends calling.ai.stop to halt the active AI session.

## Source

[`pkg/relay/action.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go)

Line 521.
