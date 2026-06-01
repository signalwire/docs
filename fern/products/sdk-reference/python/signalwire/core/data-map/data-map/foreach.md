---
slug: "/reference/python/signalwire/core/data-map/data-map/foreach"
title: "foreach"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.data_map.DataMap.foreach"
  parent: "signalwire.core.data_map.DataMap"
  module: "signalwire.core.data_map"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py"
---
# `foreach`

Process an array from the webhook response using foreach mechanism

```
    Args:
        foreach_config: Either:
            - Dict: Foreach configuration with keys:
                - input_key: Key in API response containing the array
                - output_key: Name for the built string variable
                - max: Maximum number of items to process (optional)
                - append: Template string to append for each item
        
    Returns:
        Self for method chaining
        
    Example:
        .foreach({
            "input_key": "results",
            "output_key": "formatted_results", 
            "max": 3,
            "append": "Result: ${this.title} - ${this.summary}
```

"
})

## Signature

```python
foreach(foreach_config: Dict[str, Any]) -> DataMap
```

## Parameters

| Name             | Type             | Required | Default | Description |
| ---------------- | ---------------- | -------- | ------- | ----------- |
| `foreach_config` | `Dict[str, Any]` | yes      | —       | —           |

## Returns

`DataMap`

## Examples

```python
    Args:
        foreach_config: Either:
            - Dict: Foreach configuration with keys:
                - input_key: Key in API response containing the array
                - output_key: Name for the built string variable
                - max: Maximum number of items to process (optional)
                - append: Template string to append for each item
        
    Returns:
        Self for method chaining
        
    Example:
        .foreach({
            "input_key": "results",
            "output_key": "formatted_results", 
            "max": 3,
            "append": "Result: ${this.title} - ${this.summary}
```

## Source

[`/src/signalwire/signalwire/core/data_map.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/data_map.py)

Line 287.
