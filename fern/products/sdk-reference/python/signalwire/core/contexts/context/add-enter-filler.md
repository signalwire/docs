---
slug: "/reference/python/signalwire/core/contexts/context/add-enter-filler"
title: "add_enter_filler"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.contexts.Context.add_enter_filler"
  parent: "signalwire.core.contexts.Context"
  module: "signalwire.core.contexts"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py"
---
# `add_enter_filler`

Add enter fillers for a specific language

## Signature

```python
add_enter_filler(language_code: str, fillers: List[str]) -> Context
```

## Parameters

| Name            | Type        | Required | Default | Description                                                    |
| --------------- | ----------- | -------- | ------- | -------------------------------------------------------------- |
| `language_code` | `str`       | yes      | —       | Language code (e.g., "en-US", "es") or "default" for catch-all |
| `fillers`       | `List[str]` | yes      | —       | List of filler phrases for entering this context               |

## Returns

`Context` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/contexts.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py)

Line 962.
