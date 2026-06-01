---
slug: "/reference/python/signalwire/agent-server/agent-server/register"
title: "register"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.agent_server.AgentServer.register"
  parent: "signalwire.agent_server.AgentServer"
  module: "signalwire.agent_server"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/agent_server.py"
---
# `register`

Register an agent with the server

## Signature

```python
register(agent: AgentBase, route: Optional[str] = None) -> None
```

## Parameters

| Name    | Type            | Required | Default | Description                                          |
| ------- | --------------- | -------- | ------- | ---------------------------------------------------- |
| `agent` | `AgentBase`     | yes      | —       | The agent to register                                |
| `route` | `Optional[str]` | no       | `None`  | Optional route to override the agent's default route |

## Returns

`None`

## Throws

- `ValueError` — If the route is already in use

## Source

[`/src/signalwire/signalwire/agent_server.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/agent_server.py)

Line 102.
