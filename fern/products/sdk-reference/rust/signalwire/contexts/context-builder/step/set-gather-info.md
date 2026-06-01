---
slug: "/reference/rust/signalwire/contexts/context-builder/step/set-gather-info"
title: "set_gather_info"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::contexts::context_builder::Step::set_gather_info"
  parent: "signalwire::contexts::context_builder::Step"
  module: "contexts.context_builder"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs"
  visibility: "public"
---
# `set_gather_info`

Initialise gather\_info for this step.

## Signature

```rust
fn set_gather_info(
    &mut self,
    output_key: ?<&str>,
    completion_action: ?<&str>,
    prompt: ?<&str>
) -> &mut Self
```

## Parameters

| Name                | Type      | Required | Default | Description |
| ------------------- | --------- | -------- | ------- | ----------- |
| `output_key`        | `?<&str>` | yes      | —       | —           |
| `completion_action` | `?<&str>` | yes      | —       | —           |
| `prompt`            | `?<&str>` | yes      | —       | —           |

## Returns

`&mut Self`

## Source

[`src/contexts/context_builder.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs)

Line 287.
