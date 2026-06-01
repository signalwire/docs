---
slug: "/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/add-pattern-hint"
title: "add_pattern_hint"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.ai_config_mixin.AIConfigMixin.add_pattern_hint"
  parent: "signalwire.core.mixins.ai_config_mixin.AIConfigMixin"
  module: "signalwire.core.mixins.ai_config_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py"
---
# `add_pattern_hint`

Add a complex hint with pattern matching

## Signature

```python
add_pattern_hint(
    hint: str,
    pattern: str,
    replace: str,
    ignore_case: bool = False
) -> AgentBase
```

## Parameters

| Name          | Type   | Required | Default | Description                          |
| ------------- | ------ | -------- | ------- | ------------------------------------ |
| `hint`        | `str`  | yes      | —       | The hint to match                    |
| `pattern`     | `str`  | yes      | —       | Regular expression pattern           |
| `replace`     | `str`  | yes      | —       | Text to replace the hint with        |
| `ignore_case` | `bool` | no       | `False` | Whether to ignore case when matching |

## Returns

`AgentBase` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/mixins/ai_config_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py)

Line 49.
