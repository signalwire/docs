---
slug: "/reference/rust/signalwire/prefabs/bedrock/bedrock-agent/set-inference-params"
title: "set_inference_params"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::prefabs::bedrock::BedrockAgent::set_inference_params"
  parent: "signalwire::prefabs::bedrock::BedrockAgent"
  module: "prefabs.bedrock"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/bedrock.rs"
  visibility: "public"
---
# `set_inference_params`

Update Bedrock inference parameters. Pass `None` to keep an
existing value untouched. Mirrors the Python signature.

## Signature

```rust
fn set_inference_params(
    &mut self,
    temperature: ?<f64>,
    top_p: ?<f64>,
    max_tokens: ?<u32>
) -> &mut Self
```

## Parameters

| Name          | Type     | Required | Default | Description |
| ------------- | -------- | -------- | ------- | ----------- |
| `temperature` | `?<f64>` | yes      | —       | —           |
| `top_p`       | `?<f64>` | yes      | —       | —           |
| `max_tokens`  | `?<u32>` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/prefabs/bedrock.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/bedrock.rs)

Line 140.
