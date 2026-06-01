---
slug: "/reference/rust/signalwire/contexts/context-builder/step/add-gather-question"
title: "add_gather_question"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::contexts::context_builder::Step::add_gather_question"
  parent: "signalwire::contexts::context_builder::Step"
  module: "contexts.context_builder"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/contexts/context_builder.rs"
  visibility: "public"
---
# `add_gather_question`

Add a question to this step's gather\_info. Initialises
gather\_info if needed.

# Gather mode locks function access (IMPORTANT)

While the model is asking gather questions, the runtime
forcibly deactivates ALL of the step's other functions. The
only callable tools during a gather question are:

- `gather_submit` (the native answer-submission tool)
- Whatever names you pass in this question's `functions`
  argument

`next_step` and `change_context` are also filtered out — the
model cannot navigate away until the gather completes. This
is by design: it forces a tight ask → submit → next-question
loop.

If a question needs to call out to a tool (e.g. validate an
email, geocode a ZIP), list that tool name in this question's
`functions` argument. Functions listed here are active ONLY
for this question.

## Signature

```rust
fn add_gather_question(
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

Line 319.
