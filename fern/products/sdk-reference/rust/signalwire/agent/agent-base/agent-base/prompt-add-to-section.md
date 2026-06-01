---
slug: "/reference/rust/signalwire/agent/agent-base/agent-base/prompt-add-to-section"
title: "prompt_add_to_section"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::agent::agent_base::AgentBase::prompt_add_to_section"
  parent: "signalwire::agent::agent_base::AgentBase"
  module: "agent.agent_base"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs"
  visibility: "public"
---
# `prompt_add_to_section`

Append body text and/or bullets to an existing section.

## Signature

```rust
fn prompt_add_to_section(
    &mut self,
    title: &str,
    body: ?<&str>,
    bullets: ?<&str>
) -> &mut Self
```

## Parameters

| Name      | Type      | Required | Default | Description |
| --------- | --------- | -------- | ------- | ----------- |
| `title`   | `&str`    | yes      | —       | —           |
| `body`    | `?<&str>` | yes      | —       | —           |
| `bullets` | `?<&str>` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/agent/agent_base.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs)

Line 414.
