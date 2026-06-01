---
slug: "/reference/rust/signalwire/prefabs/bedrock/bedrock-options"
title: "BedrockOptions"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::prefabs::bedrock::BedrockOptions"
  parent: "signalwire::prefabs::bedrock"
  module: "prefabs.bedrock"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/bedrock.rs"
  visibility: "public"
---
# `BedrockOptions`

Construction options for \[`BedrockAgent`]. Mirrors the keyword
arguments of Python's `BedrockAgent.__init__`.

## Signature

```rust
struct BedrockOptions { /* fields */ }
```

## Inheritance

**Implements:** `Default`

## Properties

| Name                  | Type     | Required | Default | Description                                                |
| --------------------- | -------- | -------- | ------- | ---------------------------------------------------------- |
| `basic_auth_password` | `?<?>`   | yes      | —       | Optional basic-auth password override.                     |
| `basic_auth_user`     | `?<?>`   | yes      | —       | Optional basic-auth user override.                         |
| `host`                | `?<?>`   | yes      | —       | Optional bind host override.                               |
| `max_tokens`          | `u32`    | yes      | —       | Max generation tokens (default `1024`).                    |
| `name`                | `?`      | yes      | —       | Agent name (default `"bedrock_agent"`).                    |
| `port`                | `?<u16>` | yes      | —       | Optional bind port override.                               |
| `route`               | `?`      | yes      | —       | HTTP route (default `"/bedrock"`).                         |
| `system_prompt`       | `?<?>`   | yes      | —       | Optional system prompt to register with `set_prompt_text`. |
| `temperature`         | `f64`    | yes      | —       | Generation temperature 0..1 (default `0.7`).               |
| `top_p`               | `f64`    | yes      | —       | Nucleus sampling top-p 0..1 (default `0.9`).               |
| `voice_id`            | `?`      | yes      | —       | Bedrock voice id (default `"matthew"`).                    |

## Methods

- [`default`](/reference/rust/signalwire/prefabs/bedrock/bedrock-options/default)
- [`with_name`](/reference/rust/signalwire/prefabs/bedrock/bedrock-options/with-name) — Convenience: create with a name (other fields keep defaults).

## Source

[`src/prefabs/bedrock.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/bedrock.rs)

Line 39.
