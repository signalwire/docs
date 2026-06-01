---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/validate-basic-auth"
title: "ValidateBasicAuth"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.ValidateBasicAuth"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `ValidateBasicAuth`

ValidateBasicAuth validates the provided username and password against the agent's configured basic auth credentials using a constant-time comparison.

Python equivalent: auth\_mixin.AuthMixin.validate\_basic\_auth (auth\_mixin.py line 24) Python behavior: hmac.compare\_digest(username, exp\_user) and compare\_digest(password, exp\_pass)

## Signature

```go
func (*AgentBase) ValidateBasicAuth(username string, password string) bool
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `username` | `string` | yes      | —       | —           |
| `password` | `string` | yes      | —       | —           |

## Returns

`bool`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 1780.
