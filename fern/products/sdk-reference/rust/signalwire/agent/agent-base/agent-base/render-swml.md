---
slug: "/reference/rust/signalwire/agent/agent-base/agent-base/render-swml"
title: "render_swml"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::agent::agent_base::AgentBase::render_swml"
  parent: "signalwire::agent::agent_base::AgentBase"
  module: "agent.agent_base"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs"
  visibility: "public"
---
# `render_swml`

Build the complete SWML document for a request.

Phases:

1. Pre-answer verbs
2. Answer verb (if auto\_answer)
3. Record call verb (if record\_call)
4. Post-answer verbs
5. AI verb (via build\_ai\_verb)
6. Post-AI verbs

## Signature

```rust
fn render_swml(&self, headers: &?<?, ?>) -> ?
```

## Parameters

| Name      | Type       | Required | Default | Description |
| --------- | ---------- | -------- | ------- | ----------- |
| `headers` | `&?<?, ?>` | yes      | —       | —           |

## Returns

`?`

## Source

[`src/agent/agent_base.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs)

Line 1143.
