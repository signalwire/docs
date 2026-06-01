---
slug: "/reference/rust/signalwire/swml/service/service/add-verb"
title: "add_verb"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swml::service::Service::add_verb"
  parent: "signalwire::swml::service::Service"
  module: "swml.service"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs"
  visibility: "public"
---
# `add_verb`

Add a verb to a section, validating against the schema.

**Panics:**

Panics if the verb name is not in the schema.

## Signature

```rust
fn add_verb(&mut self, verb: &str, section: &str, config: ?)
```

## Parameters

| Name      | Type   | Required | Default | Description |
| --------- | ------ | -------- | ------- | ----------- |
| `verb`    | `&str` | yes      | —       | —           |
| `section` | `&str` | yes      | —       | —           |
| `config`  | `?`    | yes      | —       | —           |

## Source

[`src/swml/service.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/service.rs)

Line 440.
