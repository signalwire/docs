---
slug: "/reference/python/signalwire/core/swaig-function/swaig-function/validate-args"
title: "validate_args"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.swaig_function.SWAIGFunction.validate_args"
  parent: "signalwire.core.swaig_function.SWAIGFunction"
  module: "signalwire.core.swaig_function"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swaig_function.py"
---
# `validate_args`

Validate the arguments against the parameter schema.

Uses jsonschema\_rs if available for fast validation, falls back to
jsonschema if available, otherwise skips validation.

## Signature

```python
validate_args(args: Dict[str, Any]) -> tuple
```

## Parameters

| Name   | Type             | Required | Default | Description           |
| ------ | ---------------- | -------- | ------- | --------------------- |
| `args` | `Dict[str, Any]` | yes      | —       | Arguments to validate |

## Returns

`tuple` — Tuple of (is\_valid: bool, errors: list\[str]) If no validation library is available, returns (True, \[])

## Source

[`/src/signalwire/signalwire/core/swaig_function.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/swaig_function.py)

Line 180.
