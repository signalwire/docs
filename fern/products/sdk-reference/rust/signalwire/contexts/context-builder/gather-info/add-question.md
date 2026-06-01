---
slug: "/reference/rust/signalwire/contexts/context-builder/gather-info/add-question"
title: "add_question"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::contexts::context_builder::GatherInfo::add_question"
  parent: "signalwire::contexts::context_builder::GatherInfo"
  module: "contexts.context_builder"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs"
  visibility: "public"
---
# `add_question`

## Signature

```rust
fn add_question(
    &mut self,
    key: &str,
    question: &str,
    question_type: &str,
    confirm: bool,
    prompt: ?<&str>,
    functions: ?<?<?>>
) -> &mut Self
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

`&mut Self`

## Source

[`src/contexts/context_builder.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs)

Line 107.
