---
slug: "/reference/python/signalwire/core/pom-builder/pom-builder/add-subsection"
title: "add_subsection"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.pom_builder.PomBuilder.add_subsection"
  parent: "signalwire.core.pom_builder.PomBuilder"
  module: "signalwire.core.pom_builder"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/pom_builder.py"
---
# `add_subsection`

Add a subsection to an existing section, creating the parent if needed

## Signature

```python
add_subsection(
    parent_title: str,
    title: str,
    body: str = '',
    bullets: Optional[List[str]] = None
) -> PomBuilder
```

## Parameters

| Name           | Type                  | Required | Default | Description                    |
| -------------- | --------------------- | -------- | ------- | ------------------------------ |
| `parent_title` | `str`                 | yes      | —       | Title of the parent section    |
| `title`        | `str`                 | yes      | —       | Title for the new subsection   |
| `body`         | `str`                 | no       | `''`    | Optional body text             |
| `bullets`      | `Optional[List[str]]` | no       | `None`  | Optional list of bullet points |

## Returns

`PomBuilder` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/pom_builder.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/pom_builder.py)

Line 115.
