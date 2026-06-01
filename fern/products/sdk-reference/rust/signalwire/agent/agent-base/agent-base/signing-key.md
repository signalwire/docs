---
slug: "/reference/rust/signalwire/agent/agent-base/agent-base/signing-key"
title: "signing_key"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::agent::agent_base::AgentBase::signing_key"
  parent: "signalwire::agent::agent_base::AgentBase"
  module: "agent.agent_base"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs"
  visibility: "public"
---
# `signing_key`

Return the signing key resolved from `AgentOptions::signing_key`
or the `SIGNALWIRE_SIGNING_KEY` environment variable. `None`
means signature validation is disabled.

## Signature

```rust
fn signing_key(&self) -> ?<&str>
```

## Returns

`?<&str>`

## Source

[`src/agent/agent_base.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs)

Line 320.
