---
slug: "/reference/python/signalwire/core/mixins/tool-mixin/tool-mixin"
title: "ToolMixin"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.mixins.tool_mixin.ToolMixin"
  parent: "signalwire.core.mixins.tool_mixin"
  module: "signalwire.core.mixins.tool_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/tool_mixin.py"
---
# `ToolMixin`

Mixin class containing all tool/function-related methods for AgentBase

## Signature

```python
class ToolMixin
```

## Methods

- [`define_tool`](/reference/python/signalwire/core/mixins/tool-mixin/tool-mixin/define-tool) — Define a SWAIG function the AI can call.
- [`define_tools`](/reference/python/signalwire/core/mixins/tool-mixin/tool-mixin/define-tools) — Define the tools this agent can use
- [`on_function_call`](/reference/python/signalwire/core/mixins/tool-mixin/tool-mixin/on-function-call) — Called when a SWAIG function is invoked
- [`register_swaig_function`](/reference/python/signalwire/core/mixins/tool-mixin/tool-mixin/register-swaig-function) — Register a raw SWAIG function dictionary (e.g., from DataMap.to\_swaig\_function())
- [`tool`](/reference/python/signalwire/core/mixins/tool-mixin/tool-mixin/tool) — Class method decorator for defining SWAIG tools

## Source

[`/src/signalwire/signalwire/core/mixins/tool_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/tool_mixin.py)

Line 21.
