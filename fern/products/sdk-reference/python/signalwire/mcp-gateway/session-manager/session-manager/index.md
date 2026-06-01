---
slug: "/reference/python/signalwire/mcp-gateway/session-manager/session-manager"
title: "SessionManager"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.mcp_gateway.session_manager.SessionManager"
  parent: "signalwire.mcp_gateway.session_manager"
  module: "signalwire.mcp_gateway.session_manager"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/session_manager.py"
---
# `SessionManager`

Manages MCP server sessions with automatic cleanup

## Signature

```python
class SessionManager
```

## Properties

| Name                       | Type                       | Required | Default | Description |
| -------------------------- | -------------------------- | -------- | ------- | ----------- |
| `cleanup_interval`         | `cleanup_interval`         | yes      | —       | —           |
| `cleanup_thread`           | `cleanup_thread`           | yes      | —       | —           |
| `config`                   | `config`                   | yes      | —       | —           |
| `default_timeout`          | `default_timeout`          | yes      | —       | —           |
| `lock`                     | `lock`                     | yes      | —       | —           |
| `max_sessions_per_service` | `max_sessions_per_service` | yes      | —       | —           |
| `max_total_sessions`       | `max_total_sessions`       | yes      | —       | —           |
| `sessions`                 | `Dict[str, Session]`       | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/mcp-gateway/session-manager/session-manager/init)
- [`close_session`](/reference/python/signalwire/mcp-gateway/session-manager/session-manager/close-session) — Close and remove a session
- [`create_session`](/reference/python/signalwire/mcp-gateway/session-manager/session-manager/create-session) — Create and register a new session
- [`get_service_session_count`](/reference/python/signalwire/mcp-gateway/session-manager/session-manager/get-service-session-count) — Get number of active sessions for a service
- [`get_session`](/reference/python/signalwire/mcp-gateway/session-manager/session-manager/get-session) — Get an active session by ID
- [`list_sessions`](/reference/python/signalwire/mcp-gateway/session-manager/session-manager/list-sessions) — List all active sessions with their info
- [`shutdown`](/reference/python/signalwire/mcp-gateway/session-manager/session-manager/shutdown) — Shutdown all sessions and cleanup

## Source

[`/src/signalwire/signalwire/mcp_gateway/session_manager.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/mcp_gateway/session_manager.py)

Line 54.
