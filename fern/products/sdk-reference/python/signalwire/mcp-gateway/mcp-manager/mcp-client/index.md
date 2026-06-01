---
slug: "/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-client"
title: "MCPClient"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.mcp_gateway.mcp_manager.MCPClient"
  parent: "signalwire.mcp_gateway.mcp_manager"
  module: "signalwire.mcp_gateway.mcp_manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/mcp_manager.py"
---
# `MCPClient`

Client for communicating with a single MCP server process

## Signature

```python
class MCPClient
```

## Properties

| Name               | Type               | Required | Default | Description |
| ------------------ | ------------------ | -------- | ------- | ----------- |
| `lock`             | `lock`             | yes      | —       | —           |
| `pending_requests` | `pending_requests` | yes      | —       | —           |
| `process`          | `process`          | yes      | —       | —           |
| `reader_thread`    | `reader_thread`    | yes      | —       | —           |
| `request_id`       | `request_id`       | yes      | —       | —           |
| `response_queue`   | `response_queue`   | yes      | —       | —           |
| `sandbox_base_dir` | `sandbox_base_dir` | yes      | —       | —           |
| `sandbox_dir`      | `sandbox_dir`      | yes      | —       | —           |
| `service`          | `service`          | yes      | —       | —           |
| `tools`            | `tools`            | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-client/init)
- [`call_method`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-client/call-method) — Call an RPC method and wait for response
- [`call_tool`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-client/call-tool) — Call a tool on the MCP server
- [`get_tools`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-client/get-tools) — Get the list of available tools
- [`start`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-client/start) — Start the MCP server process and initialize connection
- [`stop`](/reference/python/signalwire/mcp-gateway/mcp-manager/mcp-client/stop) — Stop the MCP server process and clean up sandbox

## Source

[`/src/signalwire/signalwire/mcp_gateway/mcp_manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/mcp_manager.py)

Line 59.
