---
slug: "/reference/python/signalwire/core/agent/tools/registry/tool-registry"
title: "ToolRegistry"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.core.agent.tools.registry.ToolRegistry"
  parent: "signalwire.core.agent.tools.registry"
  module: "signalwire.core.agent.tools.registry"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent/tools/registry.py"
---
# `ToolRegistry`

Manages SWAIG function registration.

## Signature

```python
class ToolRegistry
```

## Properties

| Name    | Type    | Required | Default | Description |
| ------- | ------- | -------- | ------- | ----------- |
| `agent` | `agent` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/core/agent/tools/registry/tool-registry/init) — Initialize ToolRegistry with reference to parent agent.
- [`define_tool`](/reference/python/signalwire/core/agent/tools/registry/tool-registry/define-tool) — Define a SWAIG function that the AI can call.
- [`get_all_functions`](/reference/python/signalwire/core/agent/tools/registry/tool-registry/get-all-functions) — Get all registered functions.
- [`get_function`](/reference/python/signalwire/core/agent/tools/registry/tool-registry/get-function) — Get a registered function by name.
- [`has_function`](/reference/python/signalwire/core/agent/tools/registry/tool-registry/has-function) — Check if a function is registered.
- [`register_class_decorated_tools`](/reference/python/signalwire/core/agent/tools/registry/tool-registry/register-class-decorated-tools) — Register tools defined with @AgentBase.tool class decorator.
- [`register_swaig_function`](/reference/python/signalwire/core/agent/tools/registry/tool-registry/register-swaig-function) — Register a raw SWAIG function dictionary (e.g., from DataMap.to\_swaig\_function()).
- [`remove_function`](/reference/python/signalwire/core/agent/tools/registry/tool-registry/remove-function) — Remove a registered function.

## Source

[`/src/signalwire/signalwire/core/agent/tools/registry.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent/tools/registry.py)

Line 21.
