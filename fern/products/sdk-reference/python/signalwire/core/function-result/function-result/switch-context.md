---
slug: "/reference/python/signalwire/core/function-result/function-result/switch-context"
title: "switch_context"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.switch_context"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `switch_context`

Change agent context/prompt during conversation.

## Signature

```python
switch_context(
    system_prompt: Optional[str] = None,
    user_prompt: Optional[str] = None,
    consolidate: bool = False,
    full_reset: bool = False
) -> FunctionResult
```

## Parameters

| Name            | Type            | Required | Default | Description                                |
| --------------- | --------------- | -------- | ------- | ------------------------------------------ |
| `system_prompt` | `Optional[str]` | no       | `None`  | New system prompt                          |
| `user_prompt`   | `Optional[str]` | no       | `None`  | User message to add                        |
| `consolidate`   | `bool`          | no       | `False` | Whether to summarize existing conversation |
| `full_reset`    | `bool`          | no       | `False` | Whether to do complete context reset       |

## Returns

`FunctionResult` — self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 699.
