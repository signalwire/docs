---
slug: "/reference/rust/signalwire/agent/agent-base/agent-base/add-language"
title: "add_language"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::agent::agent_base::AgentBase::add_language"
  parent: "signalwire::agent::agent_base::AgentBase"
  module: "agent.agent_base"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs"
  visibility: "public"
---
# `add_language`

## Signature

```rust
fn add_language(&mut self, name: &str, code: &str, voice: &str) -> &mut Self
```

## Parameters

| Name    | Type   | Required | Default | Description |
| ------- | ------ | -------- | ------- | ----------- |
| `name`  | `&str` | yes      | —       | —           |
| `code`  | `&str` | yes      | —       | —           |
| `voice` | `&str` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/agent/agent_base.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs)

Line 638.
