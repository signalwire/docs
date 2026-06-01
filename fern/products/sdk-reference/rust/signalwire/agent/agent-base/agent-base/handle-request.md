---
slug: "/reference/rust/signalwire/agent/agent-base/agent-base/handle-request"
title: "handle_request"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::agent::agent_base::AgentBase::handle_request"
  parent: "signalwire::agent::agent_base::AgentBase"
  module: "agent.agent_base"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs"
  visibility: "public"
---
# `handle_request`

Handle an HTTP request. Overrides the service handler with agent-specific
logic for SWML, SWAIG dispatch, and post-prompt callbacks.

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

[`src/agent/agent_base.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs)

Line 1302.
