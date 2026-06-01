---
slug: "/reference/python/signalwire/core/mixins/mcp-server-mixin"
title: "mcp_server_mixin"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "module"
  language: "python"
  qualified_name: "signalwire.core.mixins.mcp_server_mixin"
  parent: "signalwire.core.mixins"
  module: "signalwire.core.mixins"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/mcp_server_mixin.py"
---
# `mcp_server_mixin`

Copyright (c) 2025 SignalWire

MCP Server Mixin for AgentBase

Exposes @tool decorated functions as an MCP server endpoint at /mcp.
Handles the MCP JSON-RPC 2.0 protocol: initialize, tools/list, tools/call.

## Signature

```python
module mcp_server_mixin
```

## Properties

| Name     | Type     | Required | Default | Description |
| -------- | -------- | -------- | ------- | ----------- |
| `logger` | `logger` | yes      | —       | —           |

## Classes

- [`MCPServerMixin`](/reference/python/signalwire/core/mixins/mcp-server-mixin/mcp-server-mixin) — Mixin that adds MCP server endpoint to an agent

## Source

[`/src/signalwire/signalwire/core/mixins/mcp_server_mixin.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/mixins/mcp_server_mixin.py)
