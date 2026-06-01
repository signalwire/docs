---
slug: "/reference/rust/signalwire/pom/section/section/to-value"
title: "to_value"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "method"
  language: "rust"
  qualified_name: "signalwire::pom::section::Section::to_value"
  parent: "signalwire::pom::section::Section"
  module: "pom.section"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/pom/section.rs"
  visibility: "public"
---
# `to_value`

Convert this section to a `serde_json::Value` matching
Python's `Section.to_dict` exactly. Key order is fixed
(`title`, `body`, `bullets`, `subsections`, `numbered`,
`numberedBullets`) so JSON/YAML serialisation is
byte-for-byte deterministic across ports.

The Python name is `to_dict`; in Rust the natural name for
a `serde_json::Value` is `to_value`. The cross-port surface
audit treats the two as equivalent (see
`enumerate_surface.py` METHOD\_RENAMES).

## Signature

```rust
fn to_value(&self) -> ?
```

## Returns

`?`

## Source

[`src/pom/section.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/pom/section.rs)

Line 136.
