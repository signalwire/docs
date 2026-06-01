---
slug: "/reference/python/signalwire/pom/pom/section/render-xml"
title: "render_xml"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.pom.pom.Section.render_xml"
  parent: "signalwire.pom.pom.Section"
  module: "signalwire.pom.pom"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py"
---
# `render_xml`

Render this section and all its subsections as XML.

## Signature

```python
render_xml(indent: int = 0, section_number: Optional[List[int]] = None) -> str
```

## Parameters

| Name             | Type                  | Required | Default | Description                                      |
| ---------------- | --------------------- | -------- | ------- | ------------------------------------------------ |
| `indent`         | `int`                 | no       | `0`     | The indentation level to start with (default: 0) |
| `section_number` | `Optional[List[int]]` | no       | `None`  | The current section number for numbered sections |

## Returns

`str` — A string containing the XML representation

## Source

[`/src/signalwire/signalwire/pom/pom.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/pom/pom.py)

Line 164.
