---
slug: "/reference/python/signalwire/core/function-result/function-result/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.__init__"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `__init__`

Initialize a new SWAIG function result

## Signature

```python
__init__(response: Optional[str] = None, post_process: bool = False)
```

## Parameters

| Name           | Type            | Required | Default | Description                                                                                                                   |
| -------------- | --------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `response`     | `Optional[str]` | no       | `None`  | Optional natural language response to include                                                                                 |
| `post_process` | `bool`          | no       | `False` | Whether to let AI take another turn before executing actions. Defaults to False (execute actions immediately after response). |

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 71.
