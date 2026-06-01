---
slug: "/reference/python/signalwire/core/function-result/function-result/remove-metadata"
title: "remove_metadata"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.function_result.FunctionResult.remove_metadata"
  parent: "signalwire.core.function_result.FunctionResult"
  module: "signalwire.core.function_result"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py"
---
# `remove_metadata`

Remove metadata from current function's meta\_data\_token scope.

## Signature

```python
remove_metadata(keys: Union[str, List[str]]) -> FunctionResult
```

## Parameters

| Name   | Type                    | Required | Default | Description                                 |
| ------ | ----------------------- | -------- | ------- | ------------------------------------------- |
| `keys` | `Union[str, List[str]]` | yes      | —       | Single key string or list of keys to remove |

## Returns

`FunctionResult` — self for method chaining

## Source

[`/src/signalwire/signalwire/core/function_result.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/function_result.py)

Line 616.
