---
slug: "/reference/rust/signalwire/agent/agent-base/agent-options"
title: "AgentOptions"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::agent::agent_base::AgentOptions"
  parent: "signalwire::agent::agent_base"
  module: "agent.agent_base"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs"
  visibility: "public"
---
# `AgentOptions`

Options for constructing an `AgentBase`.

## Signature

```rust
struct AgentOptions { /* fields */ }
```

## Properties

| Name                  | Type     | Required | Default | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| --------------------- | -------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `auto_answer`         | `bool`   | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `basic_auth_password` | `?<?>`   | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `basic_auth_user`     | `?<?>`   | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `host`                | `?<?>`   | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `name`                | `?`      | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `port`                | `?<u16>` | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `record_call`         | `bool`   | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `route`               | `?<?>`   | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `signing_key`         | `?<?>`   | yes      | —       | SignalWire Signing Key used to validate the `X-SignalWire-Signature` header on incoming POST webhooks (`POST /`, `POST /swaig`, `POST /post_prompt`). When `None`, the agent falls back to the `SIGNALWIRE_SIGNING_KEY` environment variable. When neither is set, the agent logs a prominent warning at startup and accepts unsigned requests — see Python parity (`webhook_validator.py`, reference at `signalwire-python/signalwire/signalwire/core/security/`). |
| `use_pom`             | `bool`   | yes      | —       | —                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |

## Methods

- [`new`](/reference/rust/signalwire/agent/agent-base/agent-options/new)

## Source

[`src/agent/agent_base.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/agent/agent_base.rs)

Line 19.
