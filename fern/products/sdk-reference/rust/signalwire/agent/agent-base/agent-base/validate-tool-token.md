---
slug: "/reference/rust/signalwire/agent/agent-base/agent-base/validate-tool-token"
title: "validate_tool_token"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::agent::agent_base::AgentBase::validate_tool_token"
  parent: "signalwire::agent::agent_base::AgentBase"
  module: "agent.agent_base"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs"
  visibility: "public"
---
# `validate_tool_token`

Validate a per-call SWAIG-function token. Returns `false` when the
function is not registered or when the SessionManager rejects the
token.

Python parity: `state_mixin.StateMixin.validate_tool_token` —
rejects unknown function names up-front. Rust's
`SessionManager::validate_token` returns `bool` (no panics on bad
input — see security/session\_manager.rs), so no try/catch is
required for parity.

## Signature

```rust
fn validate_tool_token(
    &self,
    function_name: &str,
    token: &str,
    call_id: &str
) -> bool
```

## Parameters

| Name            | Type   | Required | Default | Description |
| --------------- | ------ | -------- | ------- | ----------- |
| `function_name` | `&str` | yes      | —       | —           |
| `token`         | `&str` | yes      | —       | —           |
| `call_id`       | `&str` | yes      | —       | —           |

## Returns

`bool`

## Source

[`src/agent/agent_base.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs)

Line 350.
