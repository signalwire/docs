---
slug: "/reference/python/signalwire/cli/simulation/data-generation/generate-comprehensive-post-data"
title: "generate_comprehensive_post_data"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.cli.simulation.data_generation.generate_comprehensive_post_data"
  parent: "signalwire.cli.simulation.data_generation"
  module: "signalwire.cli.simulation.data_generation"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/simulation/data_generation.py"
---
# `generate_comprehensive_post_data`

Generate comprehensive post\_data that matches what SignalWire would send

## Signature

```python
generate_comprehensive_post_data(
    function_name: str,
    args: Dict[str, Any],
    custom_data: Optional[Dict[str, Any]] = None
) -> Dict[str, Any]
```

## Parameters

| Name            | Type                       | Required | Default | Description                               |
| --------------- | -------------------------- | -------- | ------- | ----------------------------------------- |
| `function_name` | `str`                      | yes      | —       | Name of the SWAIG function being called   |
| `args`          | `Dict[str, Any]`           | yes      | —       | Function arguments                        |
| `custom_data`   | `Optional[Dict[str, Any]]` | no       | `None`  | Optional custom data to override defaults |

## Returns

`Dict[str, Any]` — Complete post\_data dict with all possible keys

## Source

[`/src/signalwire/signalwire/cli/simulation/data_generation.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/cli/simulation/data_generation.py)

Line 143.
