---
slug: "/reference/rust/signalwire/swml/document/document"
title: "Document"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::swml::document::Document"
  parent: "signalwire::swml::document"
  module: "swml.document"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/swml/document.rs"
  visibility: "public"
---
# `Document`

SWML document: version + named sections containing verb arrays.

## Signature

```rust
struct Document { /* fields */ }
```

## Inheritance

**Implements:** `Default`

## Methods

- [`add_raw_verb`](/reference/rust/signalwire/swml/document/document/add-raw-verb) — Append a pre-formatted verb value to a section.
- [`add_section`](/reference/rust/signalwire/swml/document/document/add-section) — Add a new named section. Returns `true` if created, `false` if it already existed.
- [`add_verb`](/reference/rust/signalwire/swml/document/document/add-verb) — Append a verb to the `main` section.
- [`add_verb_to_section`](/reference/rust/signalwire/swml/document/document/add-verb-to-section) — Append a verb to a named section.
- [`clear_section`](/reference/rust/signalwire/swml/document/document/clear-section) — Clear all verbs in a section (keeps the section itself).
- [`default`](/reference/rust/signalwire/swml/document/document/default)
- [`get_verbs`](/reference/rust/signalwire/swml/document/document/get-verbs) — Get a clone of the verbs for a section (empty vec if section does not exist).
- [`has_section`](/reference/rust/signalwire/swml/document/document/has-section)
- [`new`](/reference/rust/signalwire/swml/document/document/new)
- [`render`](/reference/rust/signalwire/swml/document/document/render) — Compact JSON string.
- [`render_pretty`](/reference/rust/signalwire/swml/document/document/render-pretty) — Pretty-printed JSON string.
- [`reset`](/reference/rust/signalwire/swml/document/document/reset) — Reset document to initial state (only `main` with no verbs).
- [`to_value`](/reference/rust/signalwire/swml/document/document/to-value) — Build the document as a `serde_json::Value`.
- [`version`](/reference/rust/signalwire/swml/document/document/version)

## Source

[`src/swml/document.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/swml/document.rs)

Line 6.
