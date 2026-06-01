---
slug: "/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/set-global-data"
title: "set_global_data"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.ai_config_mixin.AIConfigMixin.set_global_data"
  parent: "signalwire.core.mixins.ai_config_mixin.AIConfigMixin"
  module: "signalwire.core.mixins.ai_config_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py"
---
# `set_global_data`

Merge data into the global data available to the AI throughout the conversation.

This merges (not replaces) so that skills and other callers can each
contribute keys without clobbering each other.

## Signature

```python
set_global_data(data: Dict[str, Any]) -> AgentBase
```

## Parameters

| Name   | Type             | Required | Default | Description                        |
| ------ | ---------------- | -------- | ------- | ---------------------------------- |
| `data` | `Dict[str, Any]` | yes      | —       | Dictionary of global data to merge |

## Returns

`AgentBase` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/mixins/ai_config_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py)

Line 286.
