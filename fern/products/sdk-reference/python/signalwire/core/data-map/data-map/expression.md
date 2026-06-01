---
slug: "/reference/python/signalwire/core/data-map/data-map/expression"
title: "expression"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.data_map.DataMap.expression"
  parent: "signalwire.core.data_map.DataMap"
  module: "signalwire.core.data_map"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py"
---
# `expression`

Add an expression pattern for pattern-based responses

## Signature

```python
expression(
    test_value: str,
    pattern: Union[str, Pattern],
    output: FunctionResult,
    nomatch_output: Optional[FunctionResult] = None
) -> DataMap
```

## Parameters

| Name             | Type                       | Required | Default | Description                                                      |
| ---------------- | -------------------------- | -------- | ------- | ---------------------------------------------------------------- |
| `test_value`     | `str`                      | yes      | —       | Template string to test (e.g., "${args.command}")                |
| `pattern`        | `Union[str, Pattern]`      | yes      | —       | Regex pattern string or compiled Pattern object to match against |
| `output`         | `FunctionResult`           | yes      | —       | FunctionResult to return when pattern matches                    |
| `nomatch_output` | `Optional[FunctionResult]` | no       | `None`  | Optional FunctionResult to return when pattern doesn't match     |

## Returns

`DataMap` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/data_map.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py)

Line 173.
