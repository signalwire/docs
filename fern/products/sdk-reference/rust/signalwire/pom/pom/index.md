---
slug: "/reference/rust/signalwire/pom/pom"
title: "pom"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "module"
  language: "rust"
  qualified_name: "signalwire::pom::pom"
  parent: "signalwire::pom"
  module: "pom"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/pom/pom.rs"
  visibility: "public"
---
# `pom`

`PromptObjectModel` — root container for a POM document.

Direct port of `signalwire.pom.pom.PromptObjectModel`
(signalwire-python/signalwire/signalwire/pom/pom.py:234-540).

Owns a `Vec<Section>` (the top-level sections) and exposes
markdown / XML / JSON / YAML rendering plus structural helpers
(`add_section`, `find_section`, `add_pom_as_subsection`).

All renderers match Python byte-for-byte — the cross-port
parity contract is asserted in
`signalwire-python/tests/unit/pom/test_pom_render_parity.py` and
mirrored in this crate's inline tests.

## Classes

- [`PromptObjectModel`](/reference/rust/signalwire/pom/pom/prompt-object-model) — Root container for a Prompt Object Model document.

## Source

[`src/pom/pom.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/pom/pom.rs)

Line 1.
