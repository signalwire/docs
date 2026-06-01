---
slug: "/reference/rust/signalwire/server/agent-server/agent-server/get-agent"
title: "get_agent"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::server::agent_server::AgentServer::get_agent"
  parent: "signalwire::server::agent_server::AgentServer"
  module: "server.agent_server"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/server/agent_server.rs"
  visibility: "public"
---
# `get_agent`

Get an agent by route.

## Signature

```rust
fn get_agent(&self, route: &str) -> ?<&?>
```

## Parameters

| Name    | Type   | Required | Default | Description |
| ------- | ------ | -------- | ------- | ----------- |
| `route` | `&str` | yes      | —       | —           |

## Returns

`?<&?>`

## Source

[`src/server/agent_server.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/server/agent_server.rs)

Line 128.
