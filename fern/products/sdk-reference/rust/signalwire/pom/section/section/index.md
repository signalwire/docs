---
slug: "/reference/rust/signalwire/pom/section/section"
title: "Section"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::pom::section::Section"
  parent: "signalwire::pom::section"
  module: "pom.section"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/pom/section.rs"
  visibility: "public"
---
# `Section`

One node in a Prompt Object Model tree.

Mirrors Python's `signalwire.pom.pom.Section`. Fields are owned
strings/vecs (Rust idiom — the model is a value-type document).

## Signature

```rust
struct Section { /* fields */ }
```

## Inheritance

**Implements:** `Debug`, `Clone`, `PartialEq`, `Eq`, `Default`

## Properties

| Name               | Type      | Required | Default | Description                                                                                                                                                                                                                                |
| ------------------ | --------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `body`             | `?`       | yes      | —       | Paragraph of body text. Empty string when not set (matches Python's `body=''` default).                                                                                                                                                    |
| `bullets`          | `?<?>`    | yes      | —       | Bullet items. Rendered as `- text` (or `1. text` when `numbered_bullets` is `true`).                                                                                                                                                       |
| `numbered`         | `?<bool>` | yes      | —       | Whether this section participates in numbered numbering. `None` means "unspecified" (Python's `None` default). `Some(true)` enables numbering on this and all sibling sections at the same level (unless explicitly set to `Some(false)`). |
| `numbered_bullets` | `bool`    | yes      | —       | Whether bullets in _this_ section render as `1. x` (true) or `- x` (false). Default `false` matches Python.                                                                                                                                |
| `subsections`      | `?<?>`    | yes      | —       | Nested subsections. Renderer walks this tree depth-first.                                                                                                                                                                                  |
| `title`            | `?<?>`    | yes      | —       | The section title. `None` is valid only for the _first_ top-level section in a \[`crate::pom::PromptObjectModel`]; every other section must carry a title.                                                                                 |

## Methods

- [`add_body`](/reference/rust/signalwire/pom/section/section/add-body) — Replace the body text. Mirrors Python's `Section.add_body` — the docstring explicitly says "Add OR REPLACE the body".
- [`add_bullets`](/reference/rust/signalwire/pom/section/section/add-bullets) — Append additional bullets. Mirrors Python's `Section.add_bullets` (`self.bullets.extend(bullets)`).
- [`add_subsection`](/reference/rust/signalwire/pom/section/section/add-subsection) — Add a subsection. Mirrors Python's `Section.add_subsection` — the title is required (Python raises `ValueError` when `title is None`); we encode the same constraint by accepting `String` (not `Option<String>`).
- [`add_subsection_full`](/reference/rust/signalwire/pom/section/section/add-subsection-full) — Add a fully-specified subsection. Convenience that mirrors Python's keyword-argument form `add_subsection(title=..., body=..., bullets=..., numbered=..., numberedBullets=...)`.
- [`clone`](/reference/rust/signalwire/pom/section/section/clone)
- [`default`](/reference/rust/signalwire/pom/section/section/default)
- [`eq`](/reference/rust/signalwire/pom/section/section/eq)
- [`fmt`](/reference/rust/signalwire/pom/section/section/fmt)
- [`new`](/reference/rust/signalwire/pom/section/section/new) — Construct a section with the given title.
- [`render_markdown`](/reference/rust/signalwire/pom/section/section/render-markdown) — Render this section (and all nested subsections) as markdown. Output matches Python's `Section.render_markdown` byte-for-byte — see `signalwire-python/tests/unit/pom/test_pom_render_parity.py` for the cross-port contract.
- [`render_xml`](/reference/rust/signalwire/pom/section/section/render-xml) — Render this section as XML. Matches Python's `Section.render_xml` byte-for-byte.
- [`to_value`](/reference/rust/signalwire/pom/section/section/to-value) — Convert this section to a `serde_json::Value` matching Python's `Section.to_dict` exactly. Key order is fixed (`title`, `body`, `bullets`, `subsections`, `numbered`, `numberedBullets`) so JSON/YAML serialisation is byte-for-byte deterministic across ports.

## Source

[`src/pom/section.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/pom/section.rs)

Line 19.
