---
slug: "/reference/python/signalwire/core/swaig-function/swaig-function/execute"
title: "execute"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swaig_function.SWAIGFunction.execute"
  parent: "signalwire.core.swaig_function.SWAIGFunction"
  module: "signalwire.core.swaig_function"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swaig_function.py"
---
# `execute`

Execute the function with the given arguments

## Signature

```python
execute(
    args: Dict[str, Any],
    raw_data: Optional[Dict[str, Any]] = None
) -> Dict[str, Any]
```

## Parameters

| Name       | Type                       | Required | Default | Description                       |
| ---------- | -------------------------- | -------- | ------- | --------------------------------- |
| `args`     | `Dict[str, Any]`           | yes      | —       | Parsed arguments for the function |
| `raw_data` | `Optional[Dict[str, Any]]` | no       | `None`  | Optional raw request data         |

## Returns

`Dict[str, Any]` — Function result as a dictionary (from FunctionResult.to\_dict())

## Source

[`/src/signalwire/signalwire/core/swaig_function.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swaig_function.py)

Line 139.
