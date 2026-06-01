---
slug: "/reference/python/signalwire/core/agent-base/agent-base/get-full-url"
title: "get_full_url"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.agent_base.AgentBase.get_full_url"
  parent: "signalwire.core.agent_base.AgentBase"
  module: "signalwire.core.agent_base"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py"
---
# `get_full_url`

Get the full URL for this agent's endpoint

## Signature

```python
get_full_url(include_auth: bool = False) -> str
```

## Parameters

| Name           | Type   | Required | Default | Description                                              |
| -------------- | ------ | -------- | ------- | -------------------------------------------------------- |
| `include_auth` | `bool` | no       | `False` | Whether to include authentication credentials in the URL |

## Returns

`str` — Full URL including host, port, and route (with auth if requested)

## Source

[`/src/signalwire/signalwire/core/agent_base.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py)

Line 351.
