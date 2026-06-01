---
slug: "/reference/dotnet/signal-wire.server/agent-server/setup-sip-routing-string-bool"
title: "SetupSipRouting(string, bool)"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "method"
  language: "dotnet"
  qualified_name: "SignalWire.Server.AgentServer.SetupSipRouting(string, bool)"
  parent: "SignalWire.Server.AgentServer"
  module: "SignalWire.Server"
  visibility: "public"
---
# `SetupSipRouting(string, bool)`

Enable SIP routing on this server. `route` lets the caller pin
a non-default SIP route prefix; `autoMap` opts agents into
auto-mapped sip\_username = agent name. Matches Python's
`setup_sip_routing(self, route='/sip', auto_map=True)`.

## Signature

```dotnet
public AgentServer SetupSipRouting(string route = "/sip", bool autoMap = true)
```

## Parameters

| Name      | Type     | Required | Default  | Description |
| --------- | -------- | -------- | -------- | ----------- |
| `route`   | `string` | no       | `"/sip"` | —           |
| `autoMap` | `bool`   | no       | `true`   | —           |

## Returns

`SignalWire.Server.AgentServer`
