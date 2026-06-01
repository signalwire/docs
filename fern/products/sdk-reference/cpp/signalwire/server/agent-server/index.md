---
slug: "/reference/cpp/signalwire/server/agent-server"
title: "AgentServer"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::server::AgentServer"
  parent: "signalwire::server"
  module: "signalwire.server"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/server/agent_server.hpp"
  visibility: "public"
---
# `AgentServer`

Multi-agent hosting server.

## Signature

```cpp
class signalwire::server::AgentServer
```

## Methods

- [`~AgentServer`](/reference/cpp/signalwire/server/agent-server/agent-server__2)
- [`AgentServer`](/reference/cpp/signalwire/server/agent-server/agent-server)
- [`enable_sip_routing`](/reference/cpp/signalwire/server/agent-server/enable-sip-routing) — Enable SIP routing.
- [`list_routes`](/reference/cpp/signalwire/server/agent-server/list-routes) — List registered routes.
- [`map_sip_username`](/reference/cpp/signalwire/server/agent-server/map-sip-username) — Map a SIP username to an agent route.
- [`register_agent`](/reference/cpp/signalwire/server/agent-server/register-agent) — Register an agent at a specific route.
- [`run`](/reference/cpp/signalwire/server/agent-server/run) — Start the server (blocking).
- [`set_static_dir`](/reference/cpp/signalwire/server/agent-server/set-static-dir) — Enable static file serving from a directory.
- [`stop`](/reference/cpp/signalwire/server/agent-server/stop) — Stop the server.
- [`unregister_agent`](/reference/cpp/signalwire/server/agent-server/unregister-agent) — Unregister an agent by route.

## Source

[`include/signalwire/server/agent_server.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/server/agent_server.hpp)

Line 22.
