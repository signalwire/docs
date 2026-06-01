---
slug: "/reference/python/signalwire/core/data-map/create-expression-tool"
title: "create_expression_tool"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.core.data_map.create_expression_tool"
  parent: "signalwire.core.data_map"
  module: "signalwire.core.data_map"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py"
---
# `create_expression_tool`

Create an expression-based tool for pattern matching responses

## Signature

```python
create_expression_tool(
    name: str,
    patterns: Dict[str, Tuple[str, FunctionResult]],
    parameters: Optional[Dict[str, Dict]] = None
) -> DataMap
```

## Parameters

| Name         | Type                                    | Required | Default | Description                                                         |
| ------------ | --------------------------------------- | -------- | ------- | ------------------------------------------------------------------- |
| `name`       | `str`                                   | yes      | —       | Function name                                                       |
| `patterns`   | `Dict[str, Tuple[str, FunctionResult]]` | yes      | —       | Dictionary mapping test\_values to (pattern, FunctionResult) tuples |
| `parameters` | `Optional[Dict[str, Dict]]`             | no       | `None`  | Optional parameter definitions                                      |

## Returns

`DataMap` — Configured DataMap object

## Source

[`/src/signalwire/signalwire/core/data_map.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py)

Line 490.
