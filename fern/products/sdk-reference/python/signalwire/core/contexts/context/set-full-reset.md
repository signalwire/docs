---
slug: "/reference/python/signalwire/core/contexts/context/set-full-reset"
title: "set_full_reset"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.contexts.Context.set_full_reset"
  parent: "signalwire.core.contexts.Context"
  module: "signalwire.core.contexts"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py"
---
# `set_full_reset`

Set whether to do full reset when entering this context

## Signature

```python
set_full_reset(full_reset: bool) -> Context
```

## Parameters

| Name         | Type   | Required | Default | Description                                           |
| ------------ | ------ | -------- | ------- | ----------------------------------------------------- |
| `full_reset` | `bool` | yes      | —       | Whether to completely rewrite system prompt vs inject |

## Returns

`Context` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/contexts.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py)

Line 794.
