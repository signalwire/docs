---
slug: "/reference/python/signalwire/core/mixins/ai-config-mixin/ai-config-mixin/add-mcp-server"
title: "add_mcp_server"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.mixins.ai_config_mixin.AIConfigMixin.add_mcp_server"
  parent: "signalwire.core.mixins.ai_config_mixin.AIConfigMixin"
  module: "signalwire.core.mixins.ai_config_mixin"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py"
---
# `add_mcp_server`

Add an external MCP server for tool discovery and invocation.

Tools are discovered via the MCP protocol at session start and
registered as SWAIG functions. Resources are optionally fetched
into global\_data.

## Signature

```python
add_mcp_server(
    url: str,
    headers: Optional[Dict[str, str]] = None,
    resources: bool = False,
    resource_vars: Optional[Dict[str, str]] = None
) -> AgentBase
```

## Parameters

| Name            | Type                       | Required | Default | Description                                                                            |
| --------------- | -------------------------- | -------- | ------- | -------------------------------------------------------------------------------------- |
| `url`           | `str`                      | yes      | —       | MCP server HTTP endpoint URL                                                           |
| `headers`       | `Optional[Dict[str, str]]` | no       | `None`  | Optional HTTP headers (e.g. {"Authorization": "Bearer sk-xxx"})                        |
| `resources`     | `bool`                     | no       | `False` | Whether to fetch resources into global\_data                                           |
| `resource_vars` | `Optional[Dict[str, str]]` | no       | `None`  | Variables for URI template substitution (e.g. {"caller\_id": "${caller\_id\_number}"}) |

## Returns

`AgentBase` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/mixins/ai_config_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/ai_config_mixin.py)

Line 546.
