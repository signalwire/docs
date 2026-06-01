---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/user-event"
title: "UserEvent"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.UserEvent"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `UserEvent`

UserEvent sends a user-defined event on the call. eventName is the custom event identifier; pass "" to omit it. Optional `extra` maps are merged into the top-level wire params (mirroring Python's \*\*kwargs in user\_event(\*, event: Optional\[str] = None, \*\*kwargs)).

Wire shape (matches Python): {"event": \<eventName>, ...extra}.

## Signature

```go
func (*Call) UserEvent(eventName string, extra ...map[string]any) error
```

## Parameters

| Name        | Type             | Required | Default | Description |
| ----------- | ---------------- | -------- | ------- | ----------- |
| `eventName` | `string`         | yes      | —       | —           |
| `...extra`  | `map[string]any` | no       | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 1161.
