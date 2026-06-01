---
slug: "/reference/rust/signalwire/agent/agent-base/agent-base/create-tool-token"
title: "create_tool_token"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::agent::agent_base::AgentBase::create_tool_token"
  parent: "signalwire::agent::agent_base::AgentBase"
  module: "agent.agent_base"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs"
  visibility: "public"
---
# `create_tool_token`

Mint a per-call SWAIG-function token via the agent's SessionManager.

Python parity: `state_mixin.StateMixin._create_tool_token` —
delegates to `SessionManager::create_token` and returns `String::new()`
on failure (Python catches all exceptions and returns "").

## Signature

```rust
fn create_tool_token(&self, tool_name: &str, call_id: &str) -> ?
```

## Parameters

| Name        | Type   | Required | Default | Description |
| ----------- | ------ | -------- | ------- | ----------- |
| `tool_name` | `&str` | yes      | —       | —           |
| `call_id`   | `&str` | yes      | —       | —           |

## Returns

`?`

## Source

[`src/agent/agent_base.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs)

Line 337.
