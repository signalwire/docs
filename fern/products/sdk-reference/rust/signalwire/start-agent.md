---
slug: "/reference/rust/signalwire/start-agent"
title: "start_agent"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "function"
  language: "rust"
  qualified_name: "signalwire::start_agent"
  parent: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/lib.rs"
  visibility: "public"
---
# `start_agent`

Construct an \[`AgentServer`] containing a single \[`AgentBase`] and
run it on the configured `host:port`. Blocking call.

Mirrors Python's `signalwire.start_agent(agent, host=..., port=...)`
— the Python helper instantiates an AgentServer behind the scenes,
registers the agent, and runs it. The Rust signature accepts an
owned `AgentBase` (Rust's ownership model makes "move into the
server, then run" the natural shape).

## Signature

```rust
fn start_agent(agent: ?, host: ?<&str>, port: ?<u16>)
```

## Parameters

| Name    | Type      | Required | Default | Description |
| ------- | --------- | -------- | ------- | ----------- |
| `agent` | `?`       | yes      | —       | —           |
| `host`  | `?<&str>` | yes      | —       | —           |
| `port`  | `?<u16>`  | yes      | —       | —           |

## Source

[`src/lib.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/lib.rs)

Line 64.
