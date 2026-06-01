---
slug: "/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-service"
title: "MCPService"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.mcp_gateway.mcp_manager.MCPService"
  parent: "signalwire.mcp_gateway.mcp_manager"
  module: "signalwire.mcp_gateway.mcp_manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/mcp_manager.py"
---
# `MCPService`

Configuration for an MCP service

**Modifiers:** `dataclass`

**Decorators:** `@dataclass`

## Signature

```python
class MCPService
```

## Properties

| Name             | Type             | Required | Default | Description |
| ---------------- | ---------------- | -------- | ------- | ----------- |
| `command`        | `List[str]`      | yes      | —       | —           |
| `description`    | `str`            | yes      | —       | —           |
| `enabled`        | `bool`           | yes      | —       | —           |
| `name`           | `str`            | yes      | —       | —           |
| `sandbox_config` | `Dict[str, Any]` | yes      | —       | —           |

## Methods

- [`__hash__`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-service/hash)
- [`__init__`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-service/init)
- [`__post_init__`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-service/post-init)

## Source

[`/src/signalwire/signalwire/mcp_gateway/mcp_manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/mcp_manager.py)

Line 37.
