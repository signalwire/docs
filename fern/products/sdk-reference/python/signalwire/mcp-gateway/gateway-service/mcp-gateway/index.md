---
slug: "/reference/python/signalwire/mcp-gateway/gateway-service/mcp-gateway"
title: "MCPGateway"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.mcp_gateway.gateway_service.MCPGateway"
  parent: "signalwire.mcp_gateway.gateway_service"
  module: "signalwire.mcp_gateway.gateway_service"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/gateway_service.py"
---
# `MCPGateway`

Main gateway service class

## Signature

```python
class MCPGateway
```

## Properties

| Name              | Type              | Required | Default | Description |
| ----------------- | ----------------- | -------- | ------- | ----------- |
| `app`             | `app`             | yes      | —       | —           |
| `config`          | `config`          | yes      | —       | —           |
| `config_loader`   | `config_loader`   | yes      | —       | —           |
| `limiter`         | `limiter`         | yes      | —       | —           |
| `mcp_manager`     | `mcp_manager`     | yes      | —       | —           |
| `rate_config`     | `rate_config`     | yes      | —       | —           |
| `security`        | `security`        | yes      | —       | —           |
| `server`          | `server`          | yes      | —       | —           |
| `session_manager` | `session_manager` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/mcp-gateway/gateway-service/mcp-gateway/init)
- [`run`](/reference/python/signalwire/mcp-gateway/gateway-service/mcp-gateway/run) — Run the gateway service
- [`shutdown`](/reference/python/signalwire/mcp-gateway/gateway-service/mcp-gateway/shutdown) — Shutdown the gateway service

## Source

[`/src/signalwire/signalwire/mcp_gateway/gateway_service.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/gateway_service.py)

Line 52.
