---
slug: "/reference/python/signalwire/core/agent-base/agent-base/enable-sip-routing"
title: "enable_sip_routing"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.agent_base.AgentBase.enable_sip_routing"
  parent: "signalwire.core.agent_base.AgentBase"
  module: "signalwire.core.agent_base"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py"
---
# `enable_sip_routing`

Enable SIP-based routing for this agent

This allows the agent to automatically route SIP requests based on SIP usernames.
When enabled, an endpoint at the specified path is automatically created
that will handle SIP requests and deliver them to this agent.

## Signature

```python
enable_sip_routing(auto_map: bool = True, path: str = '/sip') -> AgentBase
```

## Parameters

| Name       | Type   | Required | Default  | Description                                                                                              |
| ---------- | ------ | -------- | -------- | -------------------------------------------------------------------------------------------------------- |
| `auto_map` | `bool` | no       | `True`   | Whether to automatically map common SIP usernames to this agent (based on the agent name and route path) |
| `path`     | `str`  | no       | `'/sip'` | The path to register the SIP routing endpoint (default: "/sip")                                          |

## Returns

`AgentBase` — Self for method chaining

## Source

[`/src/signalwire/signalwire/core/agent_base.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py)

Line 638.
