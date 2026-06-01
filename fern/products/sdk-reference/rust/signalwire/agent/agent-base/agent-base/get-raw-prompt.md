---
slug: "/reference/rust/signalwire/agent/agent-base/agent-base/get-raw-prompt"
title: "get_raw_prompt"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::agent::agent_base::AgentBase::get_raw_prompt"
  parent: "signalwire::agent::agent_base::AgentBase"
  module: "agent.agent_base"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs"
  visibility: "public"
---
# `get_raw_prompt`

Returns the raw prompt text whatever `set_prompt_text` stored, or
`None` when no raw prompt has been set. Distinct from `get_prompt`
which may return the POM array when `use_pom` is `true`.

Mirrors Python's `PromptManager.get_raw_prompt`.

## Signature

```rust
fn get_raw_prompt(&self) -> ?<&str>
```

## Returns

`?<&str>`

## Source

[`src/agent/agent_base.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs)

Line 514.
