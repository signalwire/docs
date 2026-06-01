---
slug: "/reference/rust/signalwire/swml/document/document/add-raw-verb"
title: "add_raw_verb"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::swml::document::Document::add_raw_verb"
  parent: "signalwire::swml::document::Document"
  module: "swml.document"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/document.rs"
  visibility: "public"
---
# `add_raw_verb`

Append a pre-formatted verb value to a section.

**Panics:**

Panics if the section does not exist.

## Signature

```rust
fn add_raw_verb(&mut self, section: &str, verb_hash: ?)
```

## Parameters

| Name        | Type   | Required | Default | Description |
| ----------- | ------ | -------- | ------- | ----------- |
| `section`   | `&str` | yes      | —       | —           |
| `verb_hash` | `?`    | yes      | —       | —           |

## Source

[`src/swml/document.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/document.rs)

Line 68.
