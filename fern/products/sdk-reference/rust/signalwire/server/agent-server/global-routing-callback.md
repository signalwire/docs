---
slug: "/reference/rust/signalwire/server/agent-server/global-routing-callback"
title: "GlobalRoutingCallback"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "type_alias"
  language: "rust"
  qualified_name: "signalwire::server::agent_server::GlobalRoutingCallback"
  parent: "signalwire::server::agent_server"
  module: "server.agent_server"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/server/agent_server.rs"
  visibility: "public"
---
# `GlobalRoutingCallback`

Callback signature for global request-time routing decisions.

The callback receives the parsed request body (or `None` if absent
/ unparseable) and returns:

- `Some(route)` — redirect handling to that route's agent.
- `None` — fall through to normal route dispatch.

Mirrors Python's `register_routing_callback` / `register_global_routing_callback`
signature (`Callable[[Request, Dict[str, Any]], Optional[str]]`),
modulo Rust's lack of a FastAPI Request object.

## Signature

```rust
type GlobalRoutingCallback = ?<dyn ? + ? + ?>
```

## Source

[`src/server/agent_server.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/server/agent_server.rs)

Line 22.
