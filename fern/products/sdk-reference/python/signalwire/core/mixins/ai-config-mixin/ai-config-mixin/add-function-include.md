---
slug: "/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/add-function-include"
title: "add_function_include"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.ai_config_mixin.AIConfigMixin.add_function_include"
  parent: "signalwire.core.mixins.ai_config_mixin.AIConfigMixin"
  module: "signalwire.core.mixins.ai_config_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py"
---
# `add_function_include`

Add a remote function include to the SWAIG configuration

## Signature

```python
add_function_include(
    url: str,
    functions: List[str],
    meta_data: Optional[Dict[str, Any]] = None
) -> AgentBase
```

## Parameters

| Name        | Type                       | Required | Default | Description                                            |
| ----------- | -------------------------- | -------- | ------- | ------------------------------------------------------ |
| `url`       | `str`                      | yes      | —       | URL to fetch remote functions from                     |
| `functions` | `List[str]`                | yes      | —       | List of function names to include                      |
| `meta_data` | `Optional[Dict[str, Any]]` | no       | `None`  | Optional metadata to include with the function include |

## Returns

`AgentBase` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/mixins/ai_config_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py)

Line 502.
