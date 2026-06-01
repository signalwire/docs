---
slug: "/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/add-pronunciation"
title: "add_pronunciation"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.ai_config_mixin.AIConfigMixin.add_pronunciation"
  parent: "signalwire.core.mixins.ai_config_mixin.AIConfigMixin"
  module: "signalwire.core.mixins.ai_config_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py"
---
# `add_pronunciation`

Add a pronunciation rule to help the AI speak certain words correctly

## Signature

```python
add_pronunciation(
    replace: str,
    with_text: str,
    ignore_case: bool = False
) -> AgentBase
```

## Parameters

| Name          | Type   | Required | Default | Description                          |
| ------------- | ------ | -------- | ------- | ------------------------------------ |
| `replace`     | `str`  | yes      | —       | The expression to replace            |
| `with_text`   | `str`  | yes      | —       | The phonetic spelling to use instead |
| `ignore_case` | `bool` | no       | `False` | Whether to ignore case when matching |

## Returns

`AgentBase` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/mixins/ai_config_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py)

Line 217.
