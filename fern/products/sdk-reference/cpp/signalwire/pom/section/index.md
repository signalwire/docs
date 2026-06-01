---
slug: "/reference/cpp/signalwire/pom/section"
title: "Section"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::pom::Section"
  parent: "signalwire::pom"
  module: "signalwire.pom"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp"
  visibility: "public"
---
# `Section`

One section in the Prompt Object Model tree.
Mirrors Python's signalwire.pom.pom.Section. Fields are public to match the Python attribute access pattern section.body, section.bullets, section.subsections.

## Signature

```cpp
class signalwire::pom::Section
```

## Properties

| Name              | Type                                 | Required | Default | Description                                                                                                                                                                                                                                                                                                                                                |
| ----------------- | ------------------------------------ | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `body`            | `std::string body`                   | yes      | —       | Optional paragraph of body text.                                                                                                                                                                                                                                                                                                                           |
| `bullets`         | `std::vector< std::string > bullets` | yes      | —       | Optional bullet list.                                                                                                                                                                                                                                                                                                                                      |
| `numbered`        | `std::optional< bool > numbered`     | yes      | —       | Whether this section participates in section numbering. Three-state: std::nullopt — not specified (Python None); inherits. true — explicitly numbered. false — explicitly opted out of numbering. Numbering is "all-or-none per sibling group": if any sibling has numbered == true, every sibling gets numbered unless it explicitly opts out with false. |
| `numberedBullets` | `bool numberedBullets`               | yes      | —       | When true, bullets are rendered as a numbered list (1. 2. 3.) in markdown and as <bullet id="1"> in XML, instead of dash bullets.                                                                                                                                                                                                                          |
| `subsections`     | `std::vector< Section > subsections` | yes      | —       | Nested sections (recursively the same shape).                                                                                                                                                                                                                                                                                                              |
| `title`           | `std::optional< std::string > title` | yes      | —       | Section title. Optional only on the very first top-level section (Python enforces "only the first section can have no title"); for subsections a title is always required.                                                                                                                                                                                 |

## Methods

- [`add_body`](/reference/cpp/signalwire/pom/section/add-body) — Replace (NOT append) the body text. Mirrors Python's documented "Add OR REPLACE the body text" contract.
- [`add_bullets`](/reference/cpp/signalwire/pom/section/add-bullets) — Append bullets to the existing list.
- [`add_subsection`](/reference/cpp/signalwire/pom/section/add-subsection) — Add a child subsection. Returns a reference to the newly-created subsection so callers can chain further mutations. Throws std::invalid\_argument if title is empty (Python raises ValueError("Subsections must have a title")).
- [`render_markdown`](/reference/cpp/signalwire/pom/section/render-markdown) — Render this section + subtree as Markdown. level is the heading level for this section (default 2 = ## ); section\_number is the parent path that will prefix this section's title (e.g. {1, 2} -> "1.2. "); empty means "no numbering".
- [`render_xml`](/reference/cpp/signalwire/pom/section/render-xml) — Render this section + subtree as XML. indent is the number of 2-space indents to use; section\_number follows the same rule as render\_markdown.
- [`Section`](/reference/cpp/signalwire/pom/section/section) — Build a Section. title is optional; everything else has sensible defaults so empty Sections can be created and populated incrementally via add\_body / add\_bullets / add\_subsection.
- [`to_dict`](/reference/cpp/signalwire/pom/section/to-dict) — Python-compatible alias for to\_json — Python exposes to\_dict. Returns the same JSON object.
- [`to_json`](/reference/cpp/signalwire/pom/section/to-json) — Convert the section (and its subtree) to a JSON object. Matches the Python key order: title, body, bullets, subsections, numbered, numberedBullets.

## Source

[`include/signalwire/pom/pom.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp)

Line 48.
