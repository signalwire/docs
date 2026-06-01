---
slug: "/reference/python/signalwire/core/contexts/context/move-step"
title: "move_step"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.contexts.Context.move_step"
  parent: "signalwire.core.contexts.Context"
  module: "signalwire.core.contexts"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py"
---
# `move_step`

Move an existing step to a specific position in the step order.

## Signature

```python
move_step(name: str, position: int) -> Context
```

## Parameters

| Name       | Type  | Required | Default | Description                                |
| ---------- | ----- | -------- | ------- | ------------------------------------------ |
| `name`     | `str` | yes      | —       | Step name to move                          |
| `position` | `int` | yes      | —       | Target index in the step order (0 = first) |

## Returns

`Context` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/contexts.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py)

Line 680.
