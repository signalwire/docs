---
slug: "/reference/rust/signalwire/prefabs/survey/survey-agent/new"
title: "new"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::prefabs::survey::SurveyAgent::new"
  parent: "signalwire::prefabs::survey::SurveyAgent"
  module: "prefabs.survey"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/survey.rs"
  visibility: "public"
---
# `new`

Create a new SurveyAgent.

## Signature

```rust
fn new(name: &str, questions: ?<?>, options: ?<&?<?, ?>>) -> Self
```

## Parameters

| Name        | Type          | Required | Default | Description |
| ----------- | ------------- | -------- | ------- | ----------- |
| `name`      | `&str`        | yes      | —       | —           |
| `questions` | `?<?>`        | yes      | —       | —           |
| `options`   | `?<&?<?, ?>>` | yes      | —       | —           |

## Returns

`Self`

## Source

[`src/prefabs/survey.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/survey.rs)

Line 21.
