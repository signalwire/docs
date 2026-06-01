---
slug: "/reference/python/signalwire/core/agent/tools/registry/tool-registry/get-function"
title: "get_function"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.agent.tools.registry.ToolRegistry.get_function"
  parent: "signalwire.core.agent.tools.registry.ToolRegistry"
  module: "signalwire.core.agent.tools.registry"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent/tools/registry.py"
---
# `get_function`

Get a registered function by name.

## Signature

```python
get_function(name: str) -> Optional[Union[SWAIGFunction, Dict[str, Any]]]
```

## Parameters

| Name   | Type  | Required | Default | Description   |
| ------ | ----- | -------- | ------- | ------------- |
| `name` | `str` | yes      | —       | Function name |

## Returns

`Optional[Union[SWAIGFunction, Dict[str, Any]]]` — SWAIGFunction instance or raw function dict, or None if not found

## Source

[`/src/signalwire/signalwire/core/agent/tools/registry.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent/tools/registry.py)

Line 192.
