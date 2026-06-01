---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/collect"
title: "Collect"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.Collect"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `Collect`

Collect starts collecting user input without playing media. The params argument exposes named fields that mirror Python's collect() parameters at relay/call.py:565. Pass a nil CollectParams to send an empty collect body.

Wire shape (matches Python):

```
{"node_id":..., "call_id":..., "control_id":..., "digits":..., "speech":..., ...}
```

## Signature

```go
func (*Call) Collect(params *CollectParams) *StandaloneCollectAction
```

## Parameters

| Name     | Type             | Required | Default | Description |
| -------- | ---------------- | -------- | ------- | ----------- |
| `params` | `*CollectParams` | yes      | —       | —           |

## Returns

`*StandaloneCollectAction`

## Examples

**Example 1**

```go
{"node_id":..., "call_id":..., "control_id":..., "digits":..., "speech":..., ...}
```

**Example 2**

```go
{"node_id":..., "call_id":..., "control_id":..., "digits":..., "speech":..., ...}
```

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 488.
