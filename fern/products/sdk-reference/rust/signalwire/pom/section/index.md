---
slug: "/reference/rust/signalwire/pom/section"
title: "section"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "module"
  language: "rust"
  qualified_name: "signalwire::pom::section"
  parent: "signalwire::pom"
  module: "pom"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/pom/section.rs"
  visibility: "public"
---
# `section`

Section type for the Prompt Object Model.

Direct port of `signalwire.pom.pom.Section`
(signalwire-python/signalwire/signalwire/pom/pom.py:5-231).

Each \[`Section`] holds an optional title, optional body text,
optional bullets, optional numbering flags, and a tree of nested
subsections. Renderers (`render_markdown`, `render_xml`,
`to_value`) walk the tree and emit byte-for-byte the same output
as Python's reference implementation.

## Classes

- [`Section`](/reference/rust/signalwire/pom/section/section) — One node in a Prompt Object Model tree.

## Source

[`src/pom/section.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/pom/section.rs)

Line 1.
