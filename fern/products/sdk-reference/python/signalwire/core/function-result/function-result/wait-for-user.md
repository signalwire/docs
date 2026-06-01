---
slug: "/reference/python/signalwire/core/function-result/function-result/wait-for-user"
title: "wait_for_user"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.wait_for_user"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `wait_for_user`

Control how agent waits for user input.

## Signature

```python
wait_for_user(
    enabled: Optional[bool] = None,
    timeout: Optional[int] = None,
    answer_first: bool = False
) -> FunctionResult
```

## Parameters

| Name           | Type             | Required | Default | Description                       |
| -------------- | ---------------- | -------- | ------- | --------------------------------- |
| `enabled`      | `Optional[bool]` | no       | `None`  | Boolean to enable/disable waiting |
| `timeout`      | `Optional[int]`  | no       | `None`  | Number of seconds to wait         |
| `answer_first` | `bool`           | no       | `False` | Special "answer\_first" mode      |

## Returns

`FunctionResult` — self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 456.
