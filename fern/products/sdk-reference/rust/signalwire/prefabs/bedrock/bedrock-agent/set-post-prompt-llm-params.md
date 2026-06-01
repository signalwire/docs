---
slug: "/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/set-post-prompt-llm-params"
title: "set_post_prompt_llm_params"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::prefabs::bedrock::BedrockAgent::set_post_prompt_llm_params"
  parent: "signalwire::prefabs::bedrock::BedrockAgent"
  module: "prefabs.bedrock"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/bedrock.rs"
  visibility: "public"
---
# `set_post_prompt_llm_params`

Set post-prompt LLM params — not applicable for Bedrock. Logs a
warning and is a no-op (post-prompt summarisation runs on a
platform-side model). Matches Python's documented behavior.

## Signature

```rust
fn set_post_prompt_llm_params(&mut self, _params: ?) -> &mut Self
```

## Parameters

| Name      | Type | Required | Default | Description |
| --------- | ---- | -------- | ------- | ----------- |
| `_params` | `?`  | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/prefabs/bedrock.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/bedrock.rs)

Line 182.
