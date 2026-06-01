---
slug: "/reference/python/signalwire/core/function-result/function-result/to-dict"
title: "to_dict"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.to_dict"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `to_dict`

Convert to the JSON structure expected by SWAIG

The result must have at least one of:

- 'response': Text to be spoken by the AI
- 'action': Array of action objects

Optional:

- 'post\_process': Boolean controlling when actions execute

## Signature

```python
to_dict() -> Dict[str, Any]
```

## Returns

`Dict[str, Any]` — Dictionary in SWAIG function response format

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 1503.
