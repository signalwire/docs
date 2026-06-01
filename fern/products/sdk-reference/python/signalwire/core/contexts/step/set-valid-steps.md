---
slug: "/reference/python/signalwire/core/contexts/step/set-valid-steps"
title: "set_valid_steps"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.contexts.Step.set_valid_steps"
  parent: "signalwire.core.contexts.Step"
  module: "signalwire.core.contexts"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py"
---
# `set_valid_steps`

Set which steps can be navigated to from this step

## Signature

```python
set_valid_steps(steps: List[str]) -> Step
```

## Parameters

| Name    | Type        | Required | Default | Description                                                   |
| ------- | ----------- | -------- | ------- | ------------------------------------------------------------- |
| `steps` | `List[str]` | yes      | —       | List of valid step names (include "next" for sequential flow) |

## Returns

`Step` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/contexts.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py)

Line 252.
