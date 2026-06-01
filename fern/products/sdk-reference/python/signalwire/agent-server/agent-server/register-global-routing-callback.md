---
slug: "/reference/python/signalwire/agent-server/agent-server/register-global-routing-callback"
title: "register_global_routing_callback"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.agent_server.AgentServer.register_global_routing_callback"
  parent: "signalwire.agent_server.AgentServer"
  module: "signalwire.agent_server"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/agent_server.py"
---
# `register_global_routing_callback`

Register a routing callback across all agents

This allows you to add unified routing logic to all agents at the same path.

## Signature

```python
register_global_routing_callback(
    callback_fn: Callable[Request, Dict[str, Any], Optional[str]],
    path: str
) -> None
```

## Parameters

| Name          | Type                                               | Required | Default | Description                          |
| ------------- | -------------------------------------------------- | -------- | ------- | ------------------------------------ |
| `callback_fn` | `Callable[Request, Dict[str, Any], Optional[str]]` | yes      | —       | The callback function to register    |
| `path`        | `str`                                              | yes      | —       | The path to register the callback at |

## Returns

`None`

## Source

[`/src/signalwire/signalwire/agent_server.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/agent_server.py)

Line 652.
