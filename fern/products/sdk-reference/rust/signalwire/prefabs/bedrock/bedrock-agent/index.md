---
slug: "/reference/rust/signalwire/prefabs/bedrock/bedrock-agent"
title: "BedrockAgent"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::prefabs::bedrock::BedrockAgent"
  parent: "signalwire::prefabs::bedrock"
  module: "prefabs.bedrock"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/bedrock.rs"
  visibility: "public"
---
# `BedrockAgent`

Voice-to-voice agent backed by Amazon Bedrock.

Wraps an \[`AgentBase`]: every standard agent operation
(`set_prompt_text`, `prompt_add_section`, `define_tool`, …) is
available through `Deref`/`DerefMut`. The single divergence is at
SWML rendering time: \[`BedrockAgent::render_swml`] takes the SWML
produced by `AgentBase::render_swml` and rewrites the `ai` verb
into an `amazon_bedrock` verb that carries Bedrock-specific
inference parameters (voice id, temperature, top-p) inside the
prompt object.

## Signature

```rust
struct BedrockAgent { /* fields */ }
```

## Inheritance

**Implements:** `Deref`, `DerefMut`, `Debug`

## Methods

- [`agent`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/agent) — Borrow the underlying `AgentBase` (read-only).
- [`agent_mut`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/agent-mut) — Borrow the underlying `AgentBase` (mutable). Most consumers use `Deref`/`DerefMut` for chaining; this is occasionally useful when an explicit handle is needed.
- [`deref`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/deref)
- [`deref_mut`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/deref-mut)
- [`fmt`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/fmt)
- [`max_tokens`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/max-tokens) — Current max-tokens cap.
- [`new`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/new) — Construct a new BedrockAgent.
- [`render_swml`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/render-swml) — Render SWML, transforming the `ai` verb into an `amazon_bedrock` verb that carries the Bedrock voice and inference parameters. Mirrors Python's `_render_swml`.
- [`repr`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/repr) — String representation matching Python's `__repr__`.
- [`set_inference_params`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/set-inference-params) — Update Bedrock inference parameters. Pass `None` to keep an existing value untouched. Mirrors the Python signature.
- [`set_llm_model`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/set-llm-model) — Set LLM model — not applicable for Bedrock. Logs a warning and is a no-op (Bedrock uses a fixed voice-to-voice model). Matches Python's documented behavior.
- [`set_llm_temperature`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/set-llm-temperature) — Set LLM temperature — redirects to `set_inference_params` for Bedrock. Matches Python's documented behavior.
- [`set_post_prompt_llm_params`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/set-post-prompt-llm-params) — Set post-prompt LLM params — not applicable for Bedrock. Logs a warning and is a no-op (post-prompt summarisation runs on a platform-side model). Matches Python's documented behavior.
- [`set_prompt_llm_params`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/set-prompt-llm-params) — Set prompt LLM params — Bedrock callers should use `set_inference_params` instead. Logs a warning and is a no-op. Matches Python's documented behavior.
- [`set_voice`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/set-voice) — Set the Bedrock voice id (e.g. `"matthew"`, `"joanna"`).
- [`temperature`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/temperature) — Current generation temperature.
- [`top_p`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/top-p) — Current nucleus sampling parameter.
- [`voice_id`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/voice-id) — Current voice id.

## Type Aliases

- [`Target`](/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/target)

## Source

[`src/prefabs/bedrock.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/bedrock.rs)

Line 28.
