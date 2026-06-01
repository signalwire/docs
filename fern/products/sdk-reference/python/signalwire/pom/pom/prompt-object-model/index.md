---
slug: "/reference/python/signalwire/pom/pom/prompt-object-model"
title: "PromptObjectModel"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.pom.pom.PromptObjectModel"
  parent: "signalwire.pom.pom"
  module: "signalwire.pom.pom"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py"
---
# `PromptObjectModel`

A structured data format for composing, organizing, and rendering prompt
instructions for large language models.

The Prompt Object Model provides a tree-based representation of a prompt
document composed of nested sections, each of which can include a title,
body text, bullet points, and arbitrarily nested subsections.

This class supports both machine-readability (via JSON/YAML) and structured
rendering (via Markdown/XML), making it ideal for prompt templating, modular
editing, and traceable documentation.

## Signature

```python
class PromptObjectModel
```

## Properties

| Name       | Type            | Required | Default | Description |
| ---------- | --------------- | -------- | ------- | ----------- |
| `debug`    | `debug`         | yes      | —       | —           |
| `sections` | `List[Section]` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/pom/pom/prompt-object-model/init)
- [`add_pom_as_subsection`](/reference/python/signalwire/pom/pom/prompt-object-model/add-pom-as-subsection) — Add another PromptObjectModel as a subsection to a section with the given title or section object.
- [`add_section`](/reference/python/signalwire/pom/pom/prompt-object-model/add-section) — Add a top-level section to the model.
- [`find_section`](/reference/python/signalwire/pom/pom/prompt-object-model/find-section) — Find a section by its title.
- [`from_json`](/reference/python/signalwire/pom/pom/prompt-object-model/from-json) — Create a PromptObjectModel instance from JSON data.
- [`from_yaml`](/reference/python/signalwire/pom/pom/prompt-object-model/from-yaml) — Create a PromptObjectModel instance from YAML data.
- [`render_markdown`](/reference/python/signalwire/pom/pom/prompt-object-model/render-markdown) — Render the entire model as markdown.
- [`render_xml`](/reference/python/signalwire/pom/pom/prompt-object-model/render-xml) — Render the entire model as XML.
- [`to_dict`](/reference/python/signalwire/pom/pom/prompt-object-model/to-dict) — Convert the entire model to a list of dictionaries.
- [`to_json`](/reference/python/signalwire/pom/pom/prompt-object-model/to-json) — Convert the entire model to a JSON string.
- [`to_yaml`](/reference/python/signalwire/pom/pom/prompt-object-model/to-yaml) — Convert the entire model to a YAML string.

## Source

[`/src/signalwire/signalwire/pom/pom.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py)

Line 234.
