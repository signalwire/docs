---
slug: "/reference/dotnet/signal-wire.agent/agent-base/create-tool-token-string-string"
title: "CreateToolToken(string, string)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentBase.CreateToolToken(string, string)"
  parent: "SignalWire.Agent.AgentBase"
  module: "SignalWire.Agent"
  visibility: "public"
---
# `CreateToolToken(string, string)`

Create a per-call SWAIG-function token. Returns empty
string on failure. (Python parity: `StateMixin._create_tool_token`.)

## Signature

```dotnet
public string CreateToolToken(string toolName, string callId)
```

## Parameters

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `toolName` | `string` | yes      | —       | —           |
| `callId`   | `string` | yes      | —       | —           |

## Returns

`string`
