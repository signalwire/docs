---
slug: "/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-manager"
title: "MCPManager"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.mcp_gateway.mcp_manager.MCPManager"
  parent: "signalwire.mcp_gateway.mcp_manager"
  module: "signalwire.mcp_gateway.mcp_manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/mcp_manager.py"
---
# `MCPManager`

Manages multiple MCP services and their lifecycles

## Signature

```python
class MCPManager
```

## Properties

| Name               | Type                    | Required | Default | Description |
| ------------------ | ----------------------- | -------- | ------- | ----------- |
| `clients`          | `Dict[str, MCPClient]`  | yes      | —       | —           |
| `config`           | `config`                | yes      | —       | —           |
| `sandbox_base_dir` | `sandbox_base_dir`      | yes      | —       | —           |
| `services`         | `Dict[str, MCPService]` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-manager/init)
- [`create_client`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-manager/create-client) — Create a new MCP client for a service
- [`get_service`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-manager/get-service) — Get a service definition by name
- [`get_service_tools`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-manager/get-service-tools) — Get tools for a service by starting a temporary instance
- [`list_services`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-manager/list-services) — List all available services
- [`shutdown`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-manager/shutdown) — Shutdown all active MCP clients
- [`validate_services`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-manager/validate-services) — Validate that all services can be started

## Source

[`/src/signalwire/signalwire/mcp_gateway/mcp_manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/mcp_manager.py)

Line 409.
