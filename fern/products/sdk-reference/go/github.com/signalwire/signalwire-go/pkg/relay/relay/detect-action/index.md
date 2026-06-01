---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/detect-action"
title: "DetectAction"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.DetectAction"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go"
---
# `DetectAction`

DetectAction represents a long-running detect operation (e.g. machine detection).

## Signature

```go
type DetectAction struct
```

## Properties

| Name     | Type      | Required | Default | Description |
| -------- | --------- | -------- | ------- | ----------- |
| `Action` | `*Action` | yes      | —       | —           |

## Methods

- [`Stop`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/detect-action/stop) — Stop sends calling.detect.stop to halt the active detect operation.

## Source

[`pkg/relay/action.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go)

Line 258.
