---
slug: "/reference/rust/signalwire/contexts/context-builder/gather-question/new"
title: "new"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::contexts::context_builder::GatherQuestion::new"
  parent: "signalwire::contexts::context_builder::GatherQuestion"
  module: "contexts.context_builder"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs"
  visibility: "public"
---
# `new`

## Signature

```rust
fn new(
    key: &str,
    question: &str,
    question_type: &str,
    confirm: bool,
    prompt: ?<&str>,
    functions: ?<?<?>>
) -> Self
```

## Parameters

| Name            | Type      | Required | Default | Description |
| --------------- | --------- | -------- | ------- | ----------- |
| `key`           | `&str`    | yes      | —       | —           |
| `question`      | `&str`    | yes      | —       | —           |
| `question_type` | `&str`    | yes      | —       | —           |
| `confirm`       | `bool`    | yes      | —       | —           |
| `prompt`        | `?<&str>` | yes      | —       | —           |
| `functions`     | `?<?<?>>` | yes      | —       | —           |

## Returns

`Self`

## Source

[`src/contexts/context_builder.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs)

Line 36.
