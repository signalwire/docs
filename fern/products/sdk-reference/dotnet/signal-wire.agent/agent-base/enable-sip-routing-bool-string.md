---
slug: "/reference/dotnet/signal-wire.agent/agent-base/enable-sip-routing-bool-string"
title: "EnableSipRouting(bool, string)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentBase.EnableSipRouting(bool, string)"
  parent: "SignalWire.Agent.AgentBase"
  module: "SignalWire.Agent"
  visibility: "public"
---
# `EnableSipRouting(bool, string)`

Enable SIP routing on this agent. `autoMap` opts into Python's
auto-mapping behaviour (sip\_username = agent name); `path` lets
the caller pin a specific SIP route prefix.

## Signature

```dotnet
public AgentBase EnableSipRouting(bool autoMap = false, string path = "")
```

## Parameters

| Name      | Type     | Required | Default | Description |
| --------- | -------- | -------- | ------- | ----------- |
| `autoMap` | `bool`   | no       | `false` | —           |
| `path`    | `string` | no       | `""`    | —           |

## Returns

`SignalWire.Agent.AgentBase`
