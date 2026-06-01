---
slug: "/reference/dotnet/signal-wire.agent/agent-base/register-sip-username"
title: "RegisterSipUsername"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Agent.AgentBase.RegisterSipUsername(string, string)"
  parent: "SignalWire.Agent.AgentBase"
  module: "SignalWire.Agent"
  visibility: "public"
---
# `RegisterSipUsername`

Register a SIP username under this agent's own route — Python
equivalent of `register_sip_username(self, sip_username)`.

## Signature

**Overload 1**

```dotnet
public AgentBase RegisterSipUsername(string username, string route = "")
```

**Overload 2**

```dotnet
public AgentBase RegisterSipUsername(string username)
```

## Parameters (Overload 1)

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `username` | `string` | yes      | —       | —           |
| `route`    | `string` | no       | `""`    | —           |

## Parameters (Overload 2)

| Name       | Type     | Required | Default | Description |
| ---------- | -------- | -------- | ------- | ----------- |
| `username` | `string` | yes      | —       | —           |

## Returns (Overload 1)

`SignalWire.Agent.AgentBase`

## Returns (Overload 2)

`SignalWire.Agent.AgentBase`
