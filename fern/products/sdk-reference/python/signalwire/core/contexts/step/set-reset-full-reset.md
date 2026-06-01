---
slug: "/reference/python/signalwire/core/contexts/step/set-reset-full-reset"
title: "set_reset_full_reset"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.contexts.Step.set_reset_full_reset"
  parent: "signalwire.core.contexts.Step"
  module: "signalwire.core.contexts"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py"
---
# `set_reset_full_reset`

Set whether to do full reset when this step switches contexts

## Signature

```python
set_reset_full_reset(full_reset: bool) -> Step
```

## Parameters

| Name         | Type   | Required | Default | Description                                           |
| ------------ | ------ | -------- | ------- | ----------------------------------------------------- |
| `full_reset` | `bool` | yes      | —       | Whether to completely rewrite system prompt vs inject |

## Returns

`Step` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/contexts.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py)

Line 455.
