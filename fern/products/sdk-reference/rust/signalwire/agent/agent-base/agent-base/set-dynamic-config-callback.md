---
slug: "/reference/rust/signalwire/agent/agent-base/agent-base/set-dynamic-config-callback"
title: "set_dynamic_config_callback"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::agent::agent_base::AgentBase::set_dynamic_config_callback"
  parent: "signalwire::agent::agent_base::AgentBase"
  module: "agent.agent_base"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs"
  visibility: "public"
---
# `set_dynamic_config_callback`

## Signature

```rust
fn set_dynamic_config_callback(
    &mut self,
    callback: ?<dyn ? + ? + ?>
) -> &mut Self
```

## Parameters

| Name       | Type               | Required | Default | Description |
| ---------- | ------------------ | -------- | ------- | ----------- |
| `callback` | `?<dyn ? + ? + ?>` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/agent/agent_base.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs)

Line 1054.
