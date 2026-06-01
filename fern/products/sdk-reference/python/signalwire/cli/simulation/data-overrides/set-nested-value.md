---
slug: "/reference/python/signalwire/cli/simulation/data-overrides/set-nested-value"
title: "set_nested_value"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.simulation.data_overrides.set_nested_value"
  parent: "signalwire.cli.simulation.data_overrides"
  module: "signalwire.cli.simulation.data_overrides"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/simulation/data_overrides.py"
---
# `set_nested_value`

Set a nested value using dot notation path

## Signature

```python
set_nested_value(data: Dict[str, Any], path: str, value: Any) -> None
```

## Parameters

| Name    | Type             | Required | Default | Description                                                              |
| ------- | ---------------- | -------- | ------- | ------------------------------------------------------------------------ |
| `data`  | `Dict[str, Any]` | yes      | —       | Dictionary to modify                                                     |
| `path`  | `str`            | yes      | —       | Dot-notation path (e.g., "call.call\_id" or "vars.userVariables.custom") |
| `value` | `Any`            | yes      | —       | Value to set                                                             |

## Returns

`None`

## Source

[`/src/signalwire/signalwire/cli/simulation/data_overrides.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/simulation/data_overrides.py)

Line 21.
