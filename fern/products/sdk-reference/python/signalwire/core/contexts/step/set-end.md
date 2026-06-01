---
slug: "/reference/python/signalwire/core/contexts/step/set-end"
title: "set_end"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.contexts.Step.set_end"
  parent: "signalwire.core.contexts.Step"
  module: "signalwire.core.contexts"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py"
---
# `set_end`

Mark this step as terminal for the step flow.

IMPORTANT: `end=True` does NOT end the conversation or hang up the
call. It exits step mode entirely after this step executes — clearing
the steps list, current step index, valid\_steps, and valid\_contexts.
The agent keeps running, but operates only under the base system
prompt and the context-level prompt; no more step instructions are
injected and no more `next_step` tool is offered.

To actually end the call, call a hangup tool or define a hangup\_hook.

Combine with `set_reset_*()` if you also want to reset/consolidate
the conversation when this step exits.

## Signature

```python
set_end(end: bool) -> Step
```

## Parameters

| Name  | Type   | Required | Default | Description                             |
| ----- | ------ | -------- | ------- | --------------------------------------- |
| `end` | `bool` | yes      | —       | True to exit step mode after this step. |

## Returns

`Step` — Self for method chaining.

## Source

[`/src/signalwire/signalwire/core/contexts.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py)

Line 278.
