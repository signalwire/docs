---
slug: "/reference/python/signalwire/core/pom-builder/pom-builder/from-sections"
title: "from_sections"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.pom_builder.PomBuilder.from_sections"
  parent: "signalwire.core.pom_builder.PomBuilder"
  module: "signalwire.core.pom_builder"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/pom_builder.py"
---
# `from_sections`

Create a PomBuilder from a list of section dictionaries

**Modifiers:** `classmethod`

## Signature

```python
@classmethod
from_sections(sections: List[Dict[str, Any]]) -> PomBuilder
```

## Parameters

| Name       | Type                   | Required | Default | Description                             |
| ---------- | ---------------------- | -------- | ------- | --------------------------------------- |
| `sections` | `List[Dict[str, Any]]` | yes      | —       | List of section definition dictionaries |

## Returns

`PomBuilder` — A new PomBuilder instance with the sections added

## Source

[`/src/signalwire/signalwire/core/pom_builder.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/pom_builder.py)

Line 181.
