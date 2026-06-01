---
slug: "/reference/python/signalwire/core/function-result/function-result/add-dynamic-hints"
title: "add_dynamic_hints"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.add_dynamic_hints"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `add_dynamic_hints`

Add dynamic speech recognition hints during a call.

Hints improve speech recognition accuracy for domain-specific terms.
Each hint can be a simple string or a pronunciation pattern object.

> \[!NOTE]
> result = (
> FunctionResult("I'll listen for that name")
> .add\_dynamic\_hints(\[
> "Cabby",
> {"pattern": "cab bee", "replace": "Cabby", "ignore\_case": True}
> ])
> )

## Signature

```python
add_dynamic_hints(hints: List[Union[str, Dict[str, Any]]]) -> FunctionResult
```

## Parameters

| Name    | Type                               | Required | Default | Description                                |
| ------- | ---------------------------------- | -------- | ------- | ------------------------------------------ |
| `hints` | `List[Union[str, Dict[str, Any]]]` | yes      | —       | List of hints, where each entry is either: |

## Returns

`FunctionResult` — self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 525.
