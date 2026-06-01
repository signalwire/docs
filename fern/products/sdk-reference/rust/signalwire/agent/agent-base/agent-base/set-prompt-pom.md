---
slug: "/reference/rust/signalwire/agent/agent-base/agent-base/set-prompt-pom"
title: "set_prompt_pom"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::agent::agent_base::AgentBase::set_prompt_pom"
  parent: "signalwire::agent::agent_base::AgentBase"
  module: "agent.agent_base"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs"
  visibility: "public"
---
# `set_prompt_pom`

Sets the prompt as a list of POM section objects. Each section
supports keys "title", "body", "bullets", "numbered",
"numbered\_bullets", and "subsections". Switches the agent to POM
mode.

Mirrors Python's `PromptManager.set_prompt_pom` — accepts a list
of section dicts and stores them in `pom_sections`.

## Signature

```rust
fn set_prompt_pom(&mut self, pom: ?<?>) -> &mut Self
```

## Parameters

| Name  | Type   | Required | Default | Description |
| ----- | ------ | -------- | ------- | ----------- |
| `pom` | `?<?>` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/agent/agent_base.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs)

Line 529.
