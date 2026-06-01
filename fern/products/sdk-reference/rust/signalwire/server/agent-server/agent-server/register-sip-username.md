---
slug: "/reference/rust/signalwire/server/agent-server/agent-server/register-sip-username"
title: "register_sip_username"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::server::agent_server::AgentServer::register_sip_username"
  parent: "signalwire::server::agent_server::AgentServer"
  module: "server.agent_server"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/server/agent_server.rs"
  visibility: "public"
---
# `register_sip_username`

Map a SIP username to a route.

## Signature

```rust
fn register_sip_username(&mut self, username: &str, route: &str) -> &mut Self
```

## Parameters

| Name       | Type   | Required | Default | Description |
| ---------- | ------ | -------- | ------- | ----------- |
| `username` | `&str` | yes      | —       | —           |
| `route`    | `&str` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/server/agent_server.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/server/agent_server.rs)

Line 150.
