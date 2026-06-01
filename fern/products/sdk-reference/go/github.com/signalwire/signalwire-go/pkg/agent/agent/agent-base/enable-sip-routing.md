---
slug: "/reference/go/github.com/signalwire/signalwire-go/pkg/agent/agent/agent-base/enable-sip-routing"
title: "EnableSipRouting"
sdk_label: "Go SDK"
icon: "golang"
lustri:
  auto_generated: true
  kind: "method"
  language: "go"
  qualified_name: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase.EnableSipRouting"
  parent: "github.com/signalwire/signalwire-go/pkg/agent.AgentBase"
  module: "github.com.signalwire.signalwire-go.pkg.agent"
  source_url: "https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go"
---
# `EnableSipRouting`

EnableSipRouting enables SIP-based routing for this agent.

Python equivalent: AgentBase.enable\_sip\_routing(auto\_map=True, path="/sip")

This registers a routing callback at the given path that checks incoming SIP usernames against the agent's registered username set. When autoMap is true, AutoMapSipUsernames is called to derive common usernames from the agent name and route.

The Python implementation (agent\_base.py line 612) creates a sip\_routing\_callback that extracts the SIP username from the body, checks it against \_sip\_usernames, and returns None in both the matched and unmatched case — letting the normal routing continue. It then calls register\_routing\_callback to register the callback, and optionally calls auto\_map\_sip\_usernames.

## Signature

```go
func (*AgentBase) EnableSipRouting(autoMap bool, path string) *AgentBase
```

## Parameters

| Name      | Type     | Required | Default | Description |
| --------- | -------- | -------- | ------- | ----------- |
| `autoMap` | `bool`   | yes      | —       | —           |
| `path`    | `string` | yes      | —       | —           |

## Returns

`*AgentBase`

## Source

[`pkg/agent/agent.go`](https://github.com/signalwire/signalwire-go/blob/main/pkg/agent/agent.go)

Line 2080.
