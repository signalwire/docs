---
slug: "/reference/python/signalwire/core/data-map/data-map/parameter"
title: "parameter"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.data_map.DataMap.parameter"
  parent: "signalwire.core.data_map.DataMap"
  module: "signalwire.core.data_map"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py"
---
# `parameter`

Add a function parameter.

Just like the function-level `description`, this parameter
`description` is sent to the LLM as part of the tool schema and
is read by the model when deciding HOW to fill in the argument.
Write it as an instruction to the model:

- Bad:  "the id"
- Good: "The customer's 8-digit account number, no dashes or
  spaces. Ask the user if they don't provide it."

## Signature

```python
parameter(
    name: str,
    param_type: str,
    description: str,
    required: bool = False,
    enum: Optional[List[str]] = None
) -> DataMap
```

## Parameters

| Name          | Type                  | Required | Default | Description                                                                                                                              |
| ------------- | --------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `name`        | `str`                 | yes      | —       | Parameter name. Becomes a key in the tool schema's `properties` object and is what the model emits.                                      |
| `param_type`  | `str`                 | yes      | —       | JSON schema type (string, number, boolean, array, object).                                                                               |
| `description` | `str`                 | yes      | —       | LLM-facing parameter description. See above — this should tell the model what value to put here, in what format, and where to source it. |
| `required`    | `bool`                | no       | `False` | Whether parameter is required.                                                                                                           |
| `enum`        | `Optional[List[str]]` | no       | `None`  | Optional list of allowed values. The model will only emit values from this list.                                                         |

## Returns

`DataMap` — Self for method chaining.

## Source

[`/src/signalwire/signalwire/core/data_map.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py)

Line 126.
