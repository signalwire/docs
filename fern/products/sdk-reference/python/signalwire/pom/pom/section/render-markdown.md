---
slug: "/reference/python/signalwire/pom/pom/section/render-markdown"
title: "render_markdown"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.pom.pom.Section.render_markdown"
  parent: "signalwire.pom.pom.Section"
  module: "signalwire.pom.pom"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py"
---
# `render_markdown`

Render this section and all its subsections as markdown.

## Signature

```python
render_markdown(
    level: int = 2,
    section_number: Optional[List[int]] = None
) -> str
```

## Parameters

| Name             | Type                  | Required | Default | Description                                                           |
| ---------------- | --------------------- | -------- | ------- | --------------------------------------------------------------------- |
| `level`          | `int`                 | no       | `2`     | The heading level to start with (default: 2, which corresponds to ##) |
| `section_number` | `Optional[List[int]]` | no       | `None`  | The current section number for numbered sections                      |

## Returns

`str` — A string containing the markdown representation

## Source

[`/src/signalwire/signalwire/pom/pom.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py)

Line 103.
