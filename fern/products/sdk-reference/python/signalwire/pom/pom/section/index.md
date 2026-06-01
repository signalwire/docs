---
slug: "/reference/python/signalwire/pom/pom/section"
title: "Section"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.pom.pom.Section"
  parent: "signalwire.pom.pom"
  module: "signalwire.pom.pom"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py"
---
# `Section`

Represents a section in the Prompt Object Model.

Each section contains a title, optional body text, optional bullet points,
and can have any number of nested subsections.

## Signature

```python
class Section
```

## Properties

| Name              | Type              | Required | Default | Description                                                        |
| ----------------- | ----------------- | -------- | ------- | ------------------------------------------------------------------ |
| `body`            | `body`            | yes      | —       | A paragraph of text associated with the section.                   |
| `bullets`         | `bullets`         | yes      | —       | Bullet-pointed items.                                              |
| `numbered`        | `numbered`        | yes      | —       | Whether this section should be numbered.                           |
| `numberedBullets` | `numberedBullets` | yes      | —       | Whether bullets should be numbered instead of using bullet points. |
| `subsections`     | `List[Section]`   | yes      | —       | Nested sections with the same structure.                           |
| `title`           | `title`           | yes      | —       | The name of the section.                                           |

## Methods

- [`__init__`](/reference/python/signalwire/pom/pom/section/init)
- [`add_body`](/reference/python/signalwire/pom/pom/section/add-body) — Add or replace the body text for this section.
- [`add_bullets`](/reference/python/signalwire/pom/pom/section/add-bullets) — Add bullet points to this section.
- [`add_subsection`](/reference/python/signalwire/pom/pom/section/add-subsection) — Add a subsection to this section.
- [`render_markdown`](/reference/python/signalwire/pom/pom/section/render-markdown) — Render this section and all its subsections as markdown.
- [`render_xml`](/reference/python/signalwire/pom/pom/section/render-xml) — Render this section and all its subsections as XML.
- [`to_dict`](/reference/python/signalwire/pom/pom/section/to-dict) — Convert the section to a dictionary representation.

## Source

[`/src/signalwire/signalwire/pom/pom.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py)

Line 5.
