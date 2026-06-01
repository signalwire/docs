---
slug: "/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/render-swml"
title: "render_swml"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::prefabs::bedrock::BedrockAgent::render_swml"
  parent: "signalwire::prefabs::bedrock::BedrockAgent"
  module: "prefabs.bedrock"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/bedrock.rs"
  visibility: "public"
---
# `render_swml`

Render SWML, transforming the `ai` verb into an
`amazon_bedrock` verb that carries the Bedrock voice and
inference parameters. Mirrors Python's `_render_swml`.

## Signature

```rust
fn render_swml(&self, headers: &?<?, ?>) -> ?
```

## Parameters

| Name      | Type       | Required | Default | Description |
| --------- | ---------- | -------- | ------- | ----------- |
| `headers` | `&?<?, ?>` | yes      | —       | —           |

## Returns

`?`

## Source

[`src/prefabs/bedrock.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/bedrock.rs)

Line 201.
