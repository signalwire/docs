---
slug: "/reference/rust/signalwire/agent/agent-base/agent-base/set-signing-key"
title: "set_signing_key"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::agent::agent_base::AgentBase::set_signing_key"
  parent: "signalwire::agent::agent_base::AgentBase"
  module: "agent.agent_base"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs"
  visibility: "public"
---
# `set_signing_key`

Set or clear the signing key after construction. Useful for
tests and dynamic-config flows. Pass an empty string or
`None`-equivalent to disable.

## Signature

```rust
fn set_signing_key(&mut self, key: ?<&str>) -> &mut Self
```

## Parameters

| Name  | Type      | Required | Default | Description |
| ----- | --------- | -------- | ------- | ----------- |
| `key` | `?<&str>` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/agent/agent_base.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs)

Line 327.
