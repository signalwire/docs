---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/record-action"
title: "RecordAction"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.RecordAction"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go"
---
# `RecordAction`

RecordAction represents a long-running record operation.

## Signature

```go
type RecordAction struct
```

## Properties

| Name     | Type      | Required | Default | Description |
| -------- | --------- | -------- | ------- | ----------- |
| `Action` | `*Action` | yes      | —       | —           |

## Methods

- [`Pause`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/record-action/pause) — Pause pauses the active recording. An optional behavior string may be provided (e.g. "silence" or "skip") to control how the gap is handled. Pass no argument — or "" — to omit behavior, matching Python's pause(behavior: Optional\[str] = None) signature.
- [`Resume`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/record-action/resume) — Resume resumes a paused recording.
- [`Stop`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/record-action/stop) — Stop sends calling.record.stop to halt the active recording.

## Source

[`pkg/relay/action.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go)

Line 198.
