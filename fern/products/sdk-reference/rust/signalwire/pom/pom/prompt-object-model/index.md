---
slug: "/reference/rust/signalwire/pom/pom/prompt-object-model"
title: "PromptObjectModel"
sdk_label: "Rust SDK"
icon: "rust"
lustri:
  auto_generated: true
  kind: "class"
  language: "rust"
  qualified_name: "signalwire::pom::pom::PromptObjectModel"
  parent: "signalwire::pom::pom"
  module: "pom.pom"
  source_url: "https://github.com/signalwire/signalwire-rust/blob/main/src/pom/pom.rs"
  visibility: "public"
---
# `PromptObjectModel`

Root container for a Prompt Object Model document.

Mirrors Python's `signalwire.pom.pom.PromptObjectModel`. Construct
with \[`PromptObjectModel::new`], populate with [`add_section`],
then render via [`render_markdown`], [`render_xml`], [`to_json`],
or [`to_yaml`].

[`add_section`]: PromptObjectModel::add_section

[`render_markdown`]: PromptObjectModel::render_markdown

[`render_xml`]: PromptObjectModel::render_xml

[`to_json`]: PromptObjectModel::to_json

[`to_yaml`]: PromptObjectModel::to_yaml

## Signature

```rust
struct PromptObjectModel { /* fields */ }
```

## Inheritance

**Implements:** `Debug`, `Clone`, `Default`, `PartialEq`, `Eq`

## Properties

| Name       | Type   | Required | Default | Description                                                                                                                                                                       |
| ---------- | ------ | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `sections` | `?<?>` | yes      | —       | Top-level sections, in insertion order. Only the _first_ entry may have `title = None`; all others must carry a title (Python raises `ValueError` otherwise — see `add_section`). |

## Methods

- [`add_pom_as_subsection`](/reference/rust/signalwire/pom/pom/prompt-object-model/add-pom-as-subsection) — Append every top-level section of `pom_to_add` as a subsection of the section identified by `target_title`.
- [`add_section`](/reference/rust/signalwire/pom/pom/prompt-object-model/add-section) — Append a top-level section with the given title and body.
- [`add_section_with`](/reference/rust/signalwire/pom/pom/prompt-object-model/add-section-with) — Append a top-level section with title + body in one call. Convenience wrapper that mirrors Python's keyword-style `add_section(title=..., body=...)`.
- [`clone`](/reference/rust/signalwire/pom/pom/prompt-object-model/clone)
- [`default`](/reference/rust/signalwire/pom/pom/prompt-object-model/default)
- [`eq`](/reference/rust/signalwire/pom/pom/prompt-object-model/eq)
- [`find_section`](/reference/rust/signalwire/pom/pom/prompt-object-model/find-section) — Find the first section (recursively, depth-first) with the given title. Returns `None` when no match. Mirrors Python's `find_section`.
- [`find_section_mut`](/reference/rust/signalwire/pom/pom/prompt-object-model/find-section-mut) — Mutable variant of \[`find_section`].
- [`fmt`](/reference/rust/signalwire/pom/pom/prompt-object-model/fmt)
- [`from_json`](/reference/rust/signalwire/pom/pom/prompt-object-model/from-json) — Parse a JSON string into a \[`PromptObjectModel`]. Mirrors Python's `PromptObjectModel.from_json(json_data)`.
- [`from_value`](/reference/rust/signalwire/pom/pom/prompt-object-model/from-value) — Build a model from a parsed `serde_json::Value`. Used by both \[`from_json`] and \[`from_yaml`].
- [`from_yaml`](/reference/rust/signalwire/pom/pom/prompt-object-model/from-yaml) — Parse a YAML string into a \[`PromptObjectModel`]. Mirrors Python's `PromptObjectModel.from_yaml(yaml_data)`.
- [`new`](/reference/rust/signalwire/pom/pom/prompt-object-model/new) — Construct an empty model. Mirrors Python's `PromptObjectModel()` constructor.
- [`render_markdown`](/reference/rust/signalwire/pom/pom/prompt-object-model/render-markdown) — Render the entire model as markdown. Matches Python's `render_markdown` byte-for-byte.
- [`render_xml`](/reference/rust/signalwire/pom/pom/prompt-object-model/render-xml) — Render the entire model as XML. Matches Python's `render_xml` byte-for-byte.
- [`to_json`](/reference/rust/signalwire/pom/pom/prompt-object-model/to-json) — Render the model as a JSON string (indent=2). Matches Python's `to_json` byte-for-byte: `json.dumps([...], indent=2)`.
- [`to_value`](/reference/rust/signalwire/pom/pom/prompt-object-model/to-value) — Convert the model to a `serde_json::Value` (a JSON array of section dicts). Mirrors Python's `to_dict`. The Rust name follows serde idiom (`to_value`) but the cross-port surface audit treats `to_value` ≡ `to_dict`.
- [`to_yaml`](/reference/rust/signalwire/pom/pom/prompt-object-model/to-yaml) — Render the model as a YAML string. Matches PyYAML's output shape (`default_flow_style=False, sort_keys=False`).

## Source

[`src/pom/pom.rs`](https://github.com/signalwire/signalwire-rust/blob/main/src/pom/pom.rs)

Line 32.
