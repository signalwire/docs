---
slug: "/reference/python/signalwire/pom/pom/prompt-object-model/find-section"
title: "find_section"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.pom.pom.PromptObjectModel.find_section"
  parent: "signalwire.pom.pom.PromptObjectModel"
  module: "signalwire.pom.pom"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py"
---
# `find_section`

Find a section by its title.

Performs a recursive search through all sections and subsections.

## Signature

```python
find_section(title: str) -> Optional[Section]
```

## Parameters

| Name    | Type  | Required | Default | Description             |
| ------- | ----- | -------- | ------- | ----------------------- |
| `title` | `str` | yes      | —       | The title to search for |

## Returns

`Optional[Section]` — The Section object if found, None otherwise

## Source

[`/src/signalwire/signalwire/pom/pom.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py)

Line 397.
