---
slug: "/reference/rust/signalwire/agent/agent-base/agent-base/pom"
title: "pom"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::agent::agent_base::AgentBase::pom"
  parent: "signalwire::agent::agent_base::AgentBase"
  module: "agent.agent_base"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs"
  visibility: "public"
---
# `pom`

Read-only snapshot of the agent's POM as a typed
\[`PromptObjectModel`].

Python parity: `agent.pom` instance attribute (agent\_base.py
line 209). Returns `None` when `use_pom` is `false` (mirroring
Python's `self.pom = None`); otherwise returns a freshly built
\[`PromptObjectModel`] populated from the agent's stored
section list.

Returning a typed POM (rather than the raw `Vec<Value>`) lets
callers reach for `render_markdown` / `render_xml` / `to_json`
directly without re-implementing the renderers — matching
Python's `agent.pom.render_markdown()` ergonomics.

## Signature

```rust
fn pom(&self) -> ?<?>
```

## Returns

`?<?>`

## Source

[`src/agent/agent_base.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs)

Line 480.
