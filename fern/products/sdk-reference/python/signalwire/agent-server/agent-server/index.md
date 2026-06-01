---
slug: "/reference/python/signalwire/agent-server/agent-server"
title: "AgentServer"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.agent_server.AgentServer"
  parent: "signalwire.agent_server"
  module: "signalwire.agent_server"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/agent_server.py"
---
# `AgentServer`

Server for hosting multiple SignalWire AI Agents under a single FastAPI application.

This allows you to run multiple agents on different routes of the same server,
which is useful for deployment and resource management.

> \[!NOTE]
> server = AgentServer()
> server.register(SupportAgent(), "/support")
> server.register(SalesAgent(), "/sales")
> server.run()

## Signature

```python
class AgentServer
```

## Properties

| Name        | Type                   | Required | Default | Description |
| ----------- | ---------------------- | -------- | ------- | ----------- |
| `agents`    | `Dict[str, AgentBase]` | yes      | —       | —           |
| `app`       | `app`                  | yes      | —       | —           |
| `host`      | `host`                 | yes      | —       | —           |
| `log_level` | `log_level`            | yes      | —       | —           |
| `logger`    | `logger`               | yes      | —       | —           |
| `port`      | `port`                 | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/agent-server/agent-server/init) — Initialize a new agent server
- [`get_agent`](/reference/python/signalwire/agent-server/agent-server/get-agent) — Get an agent by route
- [`get_agents`](/reference/python/signalwire/agent-server/agent-server/get-agents) — Get all registered agents
- [`register`](/reference/python/signalwire/agent-server/agent-server/register) — Register an agent with the server
- [`register_global_routing_callback`](/reference/python/signalwire/agent-server/agent-server/register-global-routing-callback) — Register a routing callback across all agents
- [`register_sip_username`](/reference/python/signalwire/agent-server/agent-server/register-sip-username) — Register a mapping from SIP username to agent route
- [`run`](/reference/python/signalwire/agent-server/agent-server/run) — Universal run method that automatically detects environment and handles accordingly
- [`serve_static_files`](/reference/python/signalwire/agent-server/agent-server/serve-static-files) — Serve static files from a directory.
- [`setup_sip_routing`](/reference/python/signalwire/agent-server/agent-server/setup-sip-routing) — Set up central SIP-based routing for the server
- [`unregister`](/reference/python/signalwire/agent-server/agent-server/unregister) — Unregister an agent from the server

## Source

[`/src/signalwire/signalwire/agent_server.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/agent_server.py)

Line 31.
