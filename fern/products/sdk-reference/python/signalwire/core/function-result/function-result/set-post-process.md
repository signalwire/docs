---
slug: "/reference/python/signalwire/core/function-result/function-result/set-post-process"
title: "set_post_process"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.set_post_process"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `set_post_process`

Set whether to enable post-processing for this result.

Post-processing allows the AI to take one more turn with the user
before executing any actions. This is useful for confirmation workflows.

## Signature

```python
set_post_process(post_process: bool) -> FunctionResult
```

## Parameters

| Name           | Type   | Required | Default | Description                                                                                                         |
| -------------- | ------ | -------- | ------- | ------------------------------------------------------------------------------------------------------------------- |
| `post_process` | `bool` | yes      | —       | True to let AI respond once more before executing actions, False to execute actions immediately after the response. |

## Returns

`FunctionResult` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 97.
