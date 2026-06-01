---
slug: "/reference/python/signalwire/core/contexts/context/set-initial-step"
title: "set_initial_step"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.contexts.Context.set_initial_step"
  parent: "signalwire.core.contexts.Context"
  module: "signalwire.core.contexts"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py"
---
# `set_initial_step`

Set which step the context starts on when entered.

By default, a context starts on its first step (index 0). If the
context has a preamble step that should only run on first entry
(e.g. a greeting), later entries via `change_context` can skip
it by setting `initial_step` to the name of the step to start
from instead.

`initial_step` is honoured both at conversation creation (when
the context is first activated) and when switching to this context
via `change_context` during the conversation.

> \[!NOTE]
> ctx = contexts.add\_context("support")
> ctx.add\_step("greeting").set\_text("Welcome!")
> ctx.add\_step("triage").set\_text("What do you need help with?")
> ctx.set\_initial\_step("triage")  # skip greeting on re-entry

## Signature

```python
set_initial_step(step_name: str) -> Context
```

## Parameters

| Name        | Type  | Required | Default | Description                                                                                                   |
| ----------- | ----- | -------- | ------- | ------------------------------------------------------------------------------------------------------------- |
| `step_name` | `str` | yes      | —       | Name of the step to start on. Must exist in this context's step list; validated by ContextBuilder.validate(). |

## Returns

`Context` — Self for method chaining.

## Source

[`/src/signalwire/signalwire/core/contexts.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py)

Line 723.
