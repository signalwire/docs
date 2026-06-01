---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/tap"
title: "Tap"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.Tap"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `Tap`

Tap starts tapping the call audio to an external destination. The optional controlID argument supplies an explicit control\_id (matches Python's tap(control\_id=...)). Pass "" or omit to auto-generate.

## Signature

```go
func (*Call) Tap(tap map[string]any, device map[string]any, controlID ...string) *TapAction
```

## Parameters

| Name           | Type             | Required | Default | Description |
| -------------- | ---------------- | -------- | ------- | ----------- |
| `tap`          | `map[string]any` | yes      | —       | —           |
| `device`       | `map[string]any` | yes      | —       | —           |
| `...controlID` | `string`         | no       | —       | —           |

## Returns

`*TapAction`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 791.
