---
slug: "/reference/python/signalwire/core/pom-builder/pom-builder"
title: "PomBuilder"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.pom_builder.PomBuilder"
  parent: "signalwire.core.pom_builder"
  module: "signalwire.core.pom_builder"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/pom_builder.py"
---
# `PomBuilder`

Builder class for creating structured prompts using the Prompt Object Model.

This class is a flexible wrapper around the POM API that allows for:

- Dynamic creation of sections on demand
- Adding content to existing sections
- Nesting subsections
- Rendering to markdown or XML

Unlike previous implementations, there are no predefined section types -
you can create any section structure that fits your needs.

## Signature

```python
class PomBuilder
```

## Properties

| Name  | Type  | Required | Default | Description |
| ----- | ----- | -------- | ------- | ----------- |
| `pom` | `pom` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/core/pom-builder/pom-builder/init) — Initialize a new POM builder with an empty POM
- [`add_section`](/reference/python/signalwire/core/pom-builder/pom-builder/add-section) — Add a new section to the POM
- [`add_subsection`](/reference/python/signalwire/core/pom-builder/pom-builder/add-subsection) — Add a subsection to an existing section, creating the parent if needed
- [`add_to_section`](/reference/python/signalwire/core/pom-builder/pom-builder/add-to-section) — Add content to an existing section
- [`from_sections`](/reference/python/signalwire/core/pom-builder/pom-builder/from-sections) — Create a PomBuilder from a list of section dictionaries
- [`get_section`](/reference/python/signalwire/core/pom-builder/pom-builder/get-section) — Get a section by title
- [`has_section`](/reference/python/signalwire/core/pom-builder/pom-builder/has-section) — Check if a section with the given title exists
- [`render_markdown`](/reference/python/signalwire/core/pom-builder/pom-builder/render-markdown) — Render the POM as markdown
- [`render_xml`](/reference/python/signalwire/core/pom-builder/pom-builder/render-xml) — Render the POM as XML
- [`to_dict`](/reference/python/signalwire/core/pom-builder/pom-builder/to-dict) — Convert the POM to a list of section dictionaries
- [`to_json`](/reference/python/signalwire/core/pom-builder/pom-builder/to-json) — Convert the POM to a JSON string

## Source

[`/src/signalwire/signalwire/core/pom_builder.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/pom_builder.py)

Line 19.
