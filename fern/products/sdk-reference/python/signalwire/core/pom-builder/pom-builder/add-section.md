---
slug: "/reference/python/signalwire/core/pom-builder/pom-builder/add-section"
title: "add_section"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.pom_builder.PomBuilder.add_section"
  parent: "signalwire.core.pom_builder.PomBuilder"
  module: "signalwire.core.pom_builder"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/pom_builder.py"
---
# `add_section`

Add a new section to the POM

## Signature

```python
add_section(
    title: str,
    body: str = '',
    bullets: Optional[List[str]] = None,
    numbered: bool = False,
    numbered_bullets: bool = False,
    subsections: Optional[List[Dict[str, Any]]] = None
) -> PomBuilder
```

## Parameters

| Name               | Type                             | Required | Default | Description                         |
| ------------------ | -------------------------------- | -------- | ------- | ----------------------------------- |
| `title`            | `str`                            | yes      | —       | Section title                       |
| `body`             | `str`                            | no       | `''`    | Optional body text                  |
| `bullets`          | `Optional[List[str]]`            | no       | `None`  | Optional list of bullet points      |
| `numbered`         | `bool`                           | no       | `False` | Whether to number this section      |
| `numbered_bullets` | `bool`                           | no       | `False` | Whether to number bullet points     |
| `subsections`      | `Optional[List[Dict[str, Any]]]` | no       | `None`  | Optional list of subsection objects |

## Returns

`PomBuilder` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/pom_builder.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/pom_builder.py)

Line 38.
