---
slug: "/reference/rust/signalwire/server/agent-server/agent-server/serve-static"
title: "serve_static"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::server::agent_server::AgentServer::serve_static"
  parent: "signalwire::server::agent_server::AgentServer"
  module: "server.agent_server"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/server/agent_server.rs"
  visibility: "public"
---
# `serve_static`

Serve static files from a directory under a URL prefix.

**Errors:**

Returns an error string if the directory does not exist.

## Signature

```rust
fn serve_static(&mut self, directory: &str, url_prefix: &str) -> ?<(), ?>
```

## Parameters

| Name         | Type   | Required | Default | Description |
| ------------ | ------ | -------- | ------- | ----------- |
| `directory`  | `&str` | yes      | —       | —           |
| `url_prefix` | `&str` | yes      | —       | —           |

## Returns

`?<(), ?>`

## Source

[`src/server/agent_server.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/server/agent_server.rs)

Line 175.
