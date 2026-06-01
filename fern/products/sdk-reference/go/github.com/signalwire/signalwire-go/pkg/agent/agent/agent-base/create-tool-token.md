---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/create-tool-token"
title: "CreateToolToken"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.CreateToolToken"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `CreateToolToken`

CreateToolToken mints a per-call SWAIG-function token via the agent's SessionManager. Returns an empty string when minting fails (Python parity: state\_mixin.StateMixin.\_create\_tool\_token, which catches all exceptions and returns "" on error).

## Signature

```go
func (*AgentBase) CreateToolToken(toolName string, callID string) (token string)
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `toolName` | `string` | yes      | —       | —           |
| `callID`   | `string` | yes      | —       | —           |

## Returns

`string`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1839.
