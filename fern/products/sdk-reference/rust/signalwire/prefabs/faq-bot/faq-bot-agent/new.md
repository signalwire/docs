---
slug: "/reference/rust/signalwire/prefabs/faq-bot/faq-bot-agent/new"
title: "new"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::prefabs::faq_bot::FAQBotAgent::new"
  parent: "signalwire::prefabs::faq_bot::FAQBotAgent"
  module: "prefabs.faq_bot"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/faq_bot.rs"
  visibility: "public"
---
# `new`

Create a new FAQBotAgent.

## Signature

```rust
fn new(
    name: &str,
    faqs: ?<?>,
    suggest_related: bool,
    persona: ?<&str>,
    route: ?<&str>
) -> Self
```

## Parameters

| Name              | Type      | Required | Default | Description |
| ----------------- | --------- | -------- | ------- | ----------- |
| `name`            | `&str`    | yes      | —       | —           |
| `faqs`            | `?<?>`    | yes      | —       | —           |
| `suggest_related` | `bool`    | yes      | —       | —           |
| `persona`         | `?<&str>` | yes      | —       | —           |
| `route`           | `?<&str>` | yes      | —       | —           |

## Returns

`Self`

## Source

[`src/prefabs/faq_bot.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/prefabs/faq_bot.rs)

Line 22.
