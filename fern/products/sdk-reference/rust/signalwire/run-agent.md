---
slug: "/reference/rust/signalwire/run-agent"
title: "run_agent"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "function"
  language: "rust"
  qualified_name: "signalwire::run_agent"
  parent: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/lib.rs"
  visibility: "public"
---
# `run_agent`

Run the supplied \[`AgentBase`] directly (without an
\[`AgentServer`]) on its configured host/port. Blocking call.

Mirrors Python's `signalwire.run_agent(agent, host=..., port=...)`.
Useful when a caller wants the agent's own routes (`/`, `/swaig`,
`/post_prompt`, `/health`) without the multi-agent wrapper.

## Signature

```rust
fn run_agent(agent: &?, _host: ?<&str>, _port: ?<u16>)
```

## Parameters

| Name    | Type      | Required | Default | Description |
| ------- | --------- | -------- | ------- | ----------- |
| `agent` | `&?`      | yes      | —       | —           |
| `_host` | `?<&str>` | yes      | —       | —           |
| `_port` | `?<u16>`  | yes      | —       | —           |

## Source

[`src/lib.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/lib.rs)

Line 78.
