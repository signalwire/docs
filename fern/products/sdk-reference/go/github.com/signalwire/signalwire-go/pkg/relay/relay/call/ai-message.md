---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/ai-message"
title: "AIMessage"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.AIMessage"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `AIMessage`

AIMessage sends a text message within an active AI session. All parameters are optional, matching Python's ai\_message(\*, message\_text=None, role=None, reset=None, global\_data=None). Pass "" for controlID/text/role and nil for reset/globalData to omit them from the wire payload (Python omits the key entirely when the argument is None).

## Signature

```go
func (*Call) AIMessage(
	controlID string,
	text string,
	role string,
	reset map[string]any,
	globalData map[string]any
) error
```

## Parameters

| Name         | Type             | Required | Default | Description |
| ------------ | ---------------- | -------- | ------- | ----------- |
| `controlID`  | `string`         | yes      | —       | —           |
| `text`       | `string`         | yes      | —       | —           |
| `role`       | `string`         | yes      | —       | —           |
| `reset`      | `map[string]any` | yes      | —       | —           |
| `globalData` | `map[string]any` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 941.
