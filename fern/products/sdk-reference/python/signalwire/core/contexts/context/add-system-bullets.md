---
slug: "/reference/python/signalwire/core/contexts/context/add-system-bullets"
title: "add_system_bullets"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.contexts.Context.add_system_bullets"
  parent: "signalwire.core.contexts.Context"
  module: "signalwire.core.contexts"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py"
---
# `add_system_bullets`

Add a POM section with bullet points to the system prompt

## Signature

```python
add_system_bullets(title: str, bullets: List[str]) -> Context
```

## Parameters

| Name      | Type        | Required | Default | Description           |
| --------- | ----------- | -------- | ------- | --------------------- |
| `title`   | `str`       | yes      | —       | Section title         |
| `bullets` | `List[str]` | yes      | —       | List of bullet points |

## Returns

`Context` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/contexts.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py)

Line 869.
