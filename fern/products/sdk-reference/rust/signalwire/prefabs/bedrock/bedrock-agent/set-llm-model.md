---
slug: "/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/set-llm-model"
title: "set_llm_model"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::prefabs::bedrock::BedrockAgent::set_llm_model"
  parent: "signalwire::prefabs::bedrock::BedrockAgent"
  module: "prefabs.bedrock"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/bedrock.rs"
  visibility: "public"
---
# `set_llm_model`

Set LLM model — not applicable for Bedrock. Logs a warning and
is a no-op (Bedrock uses a fixed voice-to-voice model). Matches
Python's documented behavior.

## Signature

```rust
fn set_llm_model(&mut self, model: &str) -> &mut Self
```

## Parameters

| Name    | Type   | Required | Default | Description |
| ------- | ------ | -------- | ------- | ----------- |
| `model` | `&str` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/prefabs/bedrock.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/bedrock.rs)

Line 165.
