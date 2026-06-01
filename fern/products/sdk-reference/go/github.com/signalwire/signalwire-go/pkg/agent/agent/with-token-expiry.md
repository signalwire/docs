---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/with-token-expiry"
title: "WithTokenExpiry"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "function"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.WithTokenExpiry"
  parent: "github.com/signalwire/signalwire-go/pkg/agent"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `WithTokenExpiry`

WithTokenExpiry sets the token expiry time in seconds for secure tools.

## Signature

```go
func WithTokenExpiry(secs int) AgentOption
```

## Parameters

| Name   | Type  | Required | Default | Description |
| ------ | ----- | -------- | ------- | ----------- |
| `secs` | `int` | yes      | —       | —           |

## Returns

`AgentOption`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 184.
