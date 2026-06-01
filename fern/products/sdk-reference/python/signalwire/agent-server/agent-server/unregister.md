---
slug: "/reference/python/signalwire/agent-server/agent-server/unregister"
title: "unregister"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.agent_server.AgentServer.unregister"
  parent: "signalwire.agent_server.AgentServer"
  module: "signalwire.agent_server"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/agent_server.py"
---
# `unregister`

Unregister an agent from the server

## Signature

```python
unregister(route: str) -> bool
```

## Parameters

| Name    | Type  | Required | Default | Description                          |
| ------- | ----- | -------- | ------- | ------------------------------------ |
| `route` | `str` | yes      | —       | The route of the agent to unregister |

## Returns

`bool` — True if the agent was unregistered, False if not found

## Source

[`/src/signalwire/signalwire/agent_server.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/agent_server.py)

Line 274.
