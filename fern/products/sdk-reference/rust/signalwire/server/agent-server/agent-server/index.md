---
slug: "/reference/rust/signalwire/server/agent-server/agent-server"
title: "AgentServer"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::server::agent_server::AgentServer"
  parent: "signalwire::server::agent_server"
  module: "server.agent_server"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/server/agent_server.rs"
  visibility: "public"
---
# `AgentServer`

Multi-agent HTTP server that dispatches requests to registered agents
by longest-prefix route matching.

## Signature

```rust
struct AgentServer { /* fields */ }
```

## Methods

- [`get_agent`](/reference/rust/signalwire/server/agent-server/agent-server/get-agent) — Get an agent by route.
- [`get_agent_mut`](/reference/rust/signalwire/server/agent-server/agent-server/get-agent-mut) — Get a mutable reference to an agent by route.
- [`get_agents`](/reference/rust/signalwire/server/agent-server/agent-server/get-agents) — Get all registered routes (sorted).
- [`handle_request`](/reference/rust/signalwire/server/agent-server/agent-server/handle-request) — Handle an HTTP request and return `(status, headers, body)`.
- [`host`](/reference/rust/signalwire/server/agent-server/agent-server/host)
- [`is_sip_routing_enabled`](/reference/rust/signalwire/server/agent-server/agent-server/is-sip-routing-enabled) — Check if SIP routing is enabled.
- [`new`](/reference/rust/signalwire/server/agent-server/agent-server/new)
- [`port`](/reference/rust/signalwire/server/agent-server/agent-server/port)
- [`register`](/reference/rust/signalwire/server/agent-server/agent-server/register) — Register an agent at its default route (from the agent's service), or at an explicit route override.
- [`register_global_routing_callback`](/reference/rust/signalwire/server/agent-server/agent-server/register-global-routing-callback) — Register a routing callback that runs on every request whose path matches the configured `path`. Returning `Some(route)` from the callback redirects handling to that registered agent; returning `None` falls through to normal longest-prefix dispatch.
- [`register_sip_username`](/reference/rust/signalwire/server/agent-server/agent-server/register-sip-username) — Map a SIP username to a route.
- [`run`](/reference/rust/signalwire/server/agent-server/agent-server/run) — Run the HTTP server on the configured host:port, blocking the current thread until the listener exits.
- [`serve_static`](/reference/rust/signalwire/server/agent-server/agent-server/serve-static) — Serve static files from a directory under a URL prefix.
- [`serve_static_files`](/reference/rust/signalwire/server/agent-server/agent-server/serve-static-files) — Serve static files from a directory under a URL prefix.
- [`setup_sip_routing`](/reference/rust/signalwire/server/agent-server/agent-server/setup-sip-routing) — Enable SIP-based routing.
- [`sip_username_mapping`](/reference/rust/signalwire/server/agent-server/agent-server/sip-username-mapping) — Get the SIP username mapping.
- [`unregister`](/reference/rust/signalwire/server/agent-server/agent-server/unregister) — Unregister an agent from a route.

## Source

[`src/server/agent_server.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/server/agent_server.rs)

Line 49.
