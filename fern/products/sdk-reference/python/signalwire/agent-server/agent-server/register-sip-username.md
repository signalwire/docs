---
slug: "/reference/python/signalwire/agent-server/agent-server/register-sip-username"
title: "register_sip_username"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.agent_server.AgentServer.register_sip_username"
  parent: "signalwire.agent_server.AgentServer"
  module: "signalwire.agent_server"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/agent_server.py"
---
# `register_sip_username`

Register a mapping from SIP username to agent route

## Signature

```python
register_sip_username(username: str, route: str) -> None
```

## Parameters

| Name       | Type  | Required | Default | Description            |
| ---------- | ----- | -------- | ------- | ---------------------- |
| `username` | `str` | yes      | —       | The SIP username       |
| `route`    | `str` | yes      | —       | The route to the agent |

## Returns

`None`

## Source

[`/src/signalwire/signalwire/agent_server.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/agent_server.py)

Line 210.
