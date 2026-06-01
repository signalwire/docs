---
slug: "/reference/cpp/signalwire/pom/prompt-object-model"
title: "PromptObjectModel"
sdk_label: "C++ SDK"
icon: "cpp"
lustri:
  auto_generated: true
  kind: "class"
  language: "cpp"
  qualified_name: "signalwire::pom::PromptObjectModel"
  parent: "signalwire::pom"
  module: "signalwire.pom"
  source_url: "https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp"
  visibility: "public"
---
# `PromptObjectModel`

Top-level container of an ordered list of sections.

## Signature

```cpp
class signalwire::pom::PromptObjectModel
```

## Properties

| Name       | Type                              | Required | Default | Description |
| ---------- | --------------------------------- | -------- | ------- | ----------- |
| `debug`    | `bool debug`                      | yes      | —       | —           |
| `sections` | `std::vector< Section > sections` | yes      | —       | —           |

## Methods

- [`add_pom_as_subsection`](/reference/cpp/signalwire/pom/prompt-object-model/add-pom-as-subsection) — Add every top-level section of pom\_to\_add as a subsection of the section identified by target\_title. Throws std::invalid\_argument when no matching section exists.
- [`add_section`](/reference/cpp/signalwire/pom/prompt-object-model/add-section) — Append a new top-level section. title may be empty only for the very first section (Python enforces "Only the first section can have no title"); subsequent calls without a title throw std::invalid\_argument.
- [`find_section`](/reference/cpp/signalwire/pom/prompt-object-model/find-section) — Recursively search for a section by title. Returns a pointer to the owned section so callers can mutate it; returns nullptr when nothing matches. Pointer is invalidated by any subsequent mutation of the POM that grows sections or subsections (caller's responsibility — same contract as std::vector::data()).
- [`from_json`](/reference/cpp/signalwire/pom/prompt-object-model/from-json) — Build a POM from a JSON string. Throws nlohmann::json::parse\_error on malformed JSON, and std::invalid\_argument on shape violations (missing required fields, wrong types, etc.).
- [`from_yaml`](/reference/cpp/signalwire/pom/prompt-object-model/from-yaml) — Build a POM from a YAML string (minimal POM-shaped subset only).
- [`PromptObjectModel`](/reference/cpp/signalwire/pom/prompt-object-model/prompt-object-model)
- [`render_markdown`](/reference/cpp/signalwire/pom/prompt-object-model/render-markdown) — Render entire POM as Markdown.
- [`render_xml`](/reference/cpp/signalwire/pom/prompt-object-model/render-xml) — Render entire POM as XML (with <?xml ... ?> prolog and a <prompt> root element).
- [`to_dict`](/reference/cpp/signalwire/pom/prompt-object-model/to-dict) — Whole-tree dict view (a json array). Identical content to to\_json, returned as a parsed json value.
- [`to_json`](/reference/cpp/signalwire/pom/prompt-object-model/to-json) — Whole-tree JSON serializer. Returns a pretty-printed (indent=2) JSON array string, matching Python's json.dumps(..., indent=2).
- [`to_yaml`](/reference/cpp/signalwire/pom/prompt-object-model/to-yaml) — Whole-tree YAML serializer. Returns a YAML document representing the JSON-equivalent list-of-dicts structure.

## Source

[`include/signalwire/pom/pom.hpp`](https://github.com/signalwire/signalwire-cpp/blob/main/include/signalwire/pom/pom.hpp)

Line 130.
