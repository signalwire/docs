---
slug: "/reference/dotnet/signal-wire.server/agent-server"
title: "AgentServer"
sdk_label: ".NET SDK"
icon: "dotnet"
lustri:
  auto_generated: true
  kind: "class"
  language: "dotnet"
  qualified_name: "SignalWire.Server.AgentServer"
  parent: "SignalWire.Server"
  module: "SignalWire.Server"
  visibility: "public"
---
# `AgentServer`

Multi-agent HTTP server. Registers agents at routes, dispatches requests by
longest prefix match, serves static files with path-traversal protection,
handles health/ready/root-index, and supports SIP routing.

## Signature

```dotnet
public class AgentServer
```

## Properties

| Name                  | Type                                       | Required | Default | Description                                                                         |
| --------------------- | ------------------------------------------ | -------- | ------- | ----------------------------------------------------------------------------------- |
| `Host`                | `public string Host { get; }`              | yes      | —       | —                                                                                   |
| `IsSipRoutingEnabled` | `public bool IsSipRoutingEnabled { get; }` | yes      | —       | —                                                                                   |
| `Logger`              | `public Logger Logger { get; }`            | yes      | —       | The agent\_server logger. (Python parity: `AgentServer.logger` instance attribute.) |
| `Port`                | `public int Port { get; }`                 | yes      | —       | —                                                                                   |

## Methods

- [`AgentServer(string, int?, string)`](/reference/dotnet/signal-wire.server/agent-server/agent-server-string-int-string)
- [`GetAgent(string)`](/reference/dotnet/signal-wire.server/agent-server/get-agent-string)
- [`GetAgents()`](/reference/dotnet/signal-wire.server/agent-server/get-agents) — Return all registered routes (sorted).
- [`GetSipUsernameMapping()`](/reference/dotnet/signal-wire.server/agent-server/get-sip-username-mapping)
- [`HandleRequest(string, string, Dictionary<string, string>?, string?)`](/reference/dotnet/signal-wire.server/agent-server/handle-request-string-string-dictionary-string-string-string) — Handle an HTTP request. Returns (status, headers, body).
- [`Register(AgentBase, string?)`](/reference/dotnet/signal-wire.server/agent-server/register-agent-base-string) — Register an agent at a route. Throws if the route is already taken.
- [`RegisterSipUsername(string, string)`](/reference/dotnet/signal-wire.server/agent-server/register-sip-username-string-string)
- [`ServeStatic(string, string)`](/reference/dotnet/signal-wire.server/agent-server/serve-static-string-string) — Serve static files from <code class="paramref">directory</code> under <code class="paramref">urlPrefix</code>. Throws if the directory does not exist.
- [`SetupSipRouting(string, bool)`](/reference/dotnet/signal-wire.server/agent-server/setup-sip-routing-string-bool) — Enable SIP routing on this server. `route` lets the caller pin a non-default SIP route prefix; `autoMap` opts agents into auto-mapped sip\_username = agent name. Matches Python's `setup_sip_routing(self, route='/sip', auto_map=True)`.
- [`Unregister(string)`](/reference/dotnet/signal-wire.server/agent-server/unregister-string)
