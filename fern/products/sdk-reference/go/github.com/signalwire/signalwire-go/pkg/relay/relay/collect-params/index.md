---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/collect-params"
title: "CollectParams"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "class"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.CollectParams"
  parent: "github.com/signalwire/signalwire-go/pkg/relay"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `CollectParams`

CollectParams holds named parameters for the Collect method, matching Python's collect() named arguments. The fields are placed at the top level of the on-wire calling.collect frame (NOT nested under a "collect" object) — mirroring Python's params\["digits"] = digits at relay/call.py:583.

## Signature

```go
type CollectParams struct
```

## Properties

| Name               | Type                            | Required | Default | Description                                                            |
| ------------------ | ------------------------------- | -------- | ------- | ---------------------------------------------------------------------- |
| `Continuous`       | `Continuous *bool`              | yes      | —       | Continuous enables continuous collection after a result is received.   |
| `ControlID`        | `ControlID string`              | yes      | —       | ControlID overrides the auto-generated control identifier.             |
| `Digits`           | `Digits map[string]any`         | yes      | —       | Digits configures DTMF digit collection.                               |
| `InitialTimeout`   | `InitialTimeout *float64`       | yes      | —       | InitialTimeout is the number of seconds to wait for first input.       |
| `OnCompleted`      | `OnCompleted func(*RelayEvent)` | yes      | —       | OnCompleted is fired when the collect action reaches a terminal state. |
| `PartialResults`   | `PartialResults *bool`          | yes      | —       | PartialResults enables streaming partial results as input is gathered. |
| `SendStartOfInput` | `SendStartOfInput *bool`        | yes      | —       | SendStartOfInput signals when the user begins speaking/pressing.       |
| `Speech`           | `Speech map[string]any`         | yes      | —       | Speech configures speech recognition collection.                       |
| `StartInputTimers` | `StartInputTimers *bool`        | yes      | —       | StartInputTimers controls whether input timers start immediately.      |

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 459.
