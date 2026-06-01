---
slug: "/reference/python/signalwire/core/contexts/gather-info"
title: "GatherInfo"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.contexts.GatherInfo"
  parent: "signalwire.core.contexts"
  module: "signalwire.core.contexts"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py"
---
# `GatherInfo`

Configuration for gathering information in a step via the C-side gather\_info system.

This produces zero tool\_call/tool\_result entries in LLM-visible history,
instead using dynamic step instruction re-injection to present one question
at a time.

## Signature

```python
class GatherInfo
```

## Methods

- [`__init__`](/reference/python/signalwire/core/contexts/gather-info/init)
- [`add_question`](/reference/python/signalwire/core/contexts/gather-info/add-question) — Add a question to gather.
- [`to_dict`](/reference/python/signalwire/core/contexts/gather-info/to-dict) — Convert to dictionary for SWML generation

## Source

[`/src/signalwire/signalwire/core/contexts.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py)

Line 51.
