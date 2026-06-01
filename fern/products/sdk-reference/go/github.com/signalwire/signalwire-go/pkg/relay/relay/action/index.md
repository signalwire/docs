---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/action"
title: "Action"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Action"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go"
---
# `Action`

Action represents a long-running operation on a call, such as playing audio, recording, or collecting input. Callers can Wait for completion, check status, or register a completion callback.

## Signature

```go
type Action struct
```

## Methods

- [`Completed`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/action/completed) — Completed returns whether the action finished.
- [`ControlID`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/action/control-id) — ControlID returns the control identifier for this action.
- [`IsDone`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/action/is-done) — IsDone returns true if the action has completed.
- [`OnCompleted`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/action/on-completed) — OnCompleted registers a callback invoked when the action completes.
- [`Result`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/action/result) — Result returns the final event that resolved this action, or nil if pending.
- [`Wait`](/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/action/wait) — Wait blocks until the action completes or the context is cancelled.

## Source

[`pkg/relay/action.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/action.go)

Line 12.
