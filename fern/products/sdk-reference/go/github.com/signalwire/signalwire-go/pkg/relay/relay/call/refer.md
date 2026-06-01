---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/refer"
title: "Refer"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.Refer"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `Refer`

Refer transfers a SIP call to an external SIP endpoint via a REFER request. statusURL is optional (empty string omits it), matching Python's refer(device, \*, status\_url).

## Signature

```go
func (*Call) Refer(device map[string]any, statusURL string) error
```

## Parameters

| Name        | Type             | Required | Default | Description |
| ----------- | ---------------- | -------- | ------- | ----------- |
| `device`    | `map[string]any` | yes      | —       | —           |
| `statusURL` | `string`         | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 299.
