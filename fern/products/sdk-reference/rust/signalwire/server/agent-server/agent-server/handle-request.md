---
slug: "/reference/rust/signalwire/server/agent-server/agent-server/handle-request"
title: "handle_request"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::server::agent_server::AgentServer::handle_request"
  parent: "signalwire::server::agent_server::AgentServer"
  module: "server.agent_server"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/server/agent_server.rs"
  visibility: "public"
---
# `handle_request`

Handle an HTTP request and return `(status, headers, body)`.

## Signature

```rust
fn handle_request(
    &self,
    method: &str,
    path: &str,
    headers: &?<?, ?>,
    body: &str
) -> (u16, ?<?, ?>, ?)
```

## Parameters

| Name      | Type       | Required | Default | Description |
| --------- | ---------- | -------- | ------- | ----------- |
| `method`  | `&str`     | yes      | —       | —           |
| `path`    | `&str`     | yes      | —       | —           |
| `headers` | `&?<?, ?>` | yes      | —       | —           |
| `body`    | `&str`     | yes      | —       | —           |

## Returns

`(u16, ?<?, ?>, ?)`

## Source

[`src/server/agent_server.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/server/agent_server.rs)

Line 291.
