---
slug: "/reference/python/signalwire/core/contexts/context/add-step"
title: "add_step"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.contexts.Context.add_step"
  parent: "signalwire.core.contexts.Context"
  module: "signalwire.core.contexts"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py"
---
# `add_step`

Add a new step to this context.

When called with only `name` the returned Step can be configured
with the usual method-chaining API.  When the optional keyword
arguments are supplied the step is fully configured in one call:

## Signature

```python
add_step(
    name: str,
    *,
    task: Optional[str] = None,
    bullets: Optional[List[str]] = None,
    criteria: Optional[str] = None,
    functions: Optional[Union[str, List[str]]] = None,
    valid_steps: Optional[List[str]] = None
) -> Step
```

## Parameters

| Name          | Type                              | Required | Default | Description                                                                                                                              |
| ------------- | --------------------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `name`        | `str`                             | yes      | —       | Step name (must be unique within the context).                                                                                           |
| `task`        | `Optional[str]`                   | no       | `None`  | Text for the "Task" section (equivalent to `step.add_section("Task", task)`).                                                            |
| `bullets`     | `Optional[List[str]]`             | no       | `None`  | List of bullet strings for the "Process" section (equivalent to `step.add_bullets("Process", bullets)`). Requires _task_ to also be set. |
| `criteria`    | `Optional[str]`                   | no       | `None`  | Step-completion criteria (equivalent to `step.set_step_criteria(criteria)`).                                                             |
| `functions`   | `Optional[Union[str, List[str]]]` | no       | `None`  | Tool names the step may call, or `"none"` (equivalent to `step.set_functions(functions)`).                                               |
| `valid_steps` | `Optional[List[str]]`             | no       | `None`  | Names of steps the agent may transition to (equivalent to `step.set_valid_steps(valid_steps)`).                                          |

## Returns

`Step` — The configured Step object for optional further chaining.

## Source

[`/src/signalwire/signalwire/core/contexts.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/contexts.py)

Line 596.
