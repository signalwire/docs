---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/relay/relay/call/ai-hold"
title: "AIHold"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/relay.Call.AIHold"
  parent: "github.com/signalwire/signalwire-go/pkg/relay.Call"
  module: "github.com.signalwire.signalwire-go.pkg.relay"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go"
---
# `AIHold`

AIHold places the AI-controlled call on hold. controlID, timeout and prompt are all optional — pass "" to omit any of them, matching Python's ai\_hold(\*, timeout: Optional\[str] = None, prompt: Optional\[str] = None) which has no control\_id parameter and only writes keys conditionally.

## Signature

```go
func (*Call) AIHold(controlID string, timeout string, prompt string) error
```

## Parameters

| Name        | Type     | Required | Default | Description |
| ----------- | -------- | -------- | ------- | ----------- |
| `controlID` | `string` | yes      | —       | —           |
| `timeout`   | `string` | yes      | —       | —           |
| `prompt`    | `string` | yes      | —       | —           |

## Returns

`error`

## Source

[`pkg/relay/call.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/relay/call.go)

Line 969.
