---
slug: "/reference/python/signalwire/agent-server/agent-server/add-security-headers"
title: "add_security_headers"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "function"
  language: "python"
  qualified_name: "signalwire.agent_server.AgentServer.__init__.add_security_headers"
  parent: "signalwire.agent_server.AgentServer.__init__"
  module: "signalwire.agent_server"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/agent_server.py"
---
# `add_security_headers`

**Modifiers:** `async`

**Decorators:** `@self.app.middleware('http')`

## Signature

```python
async add_security_headers(request, call_next)
```

## Parameters

| Name        | Type | Required | Default | Description |
| ----------- | ---- | -------- | ------- | ----------- |
| `request`   | —    | yes      | —       | —           |
| `call_next` | —    | yes      | —       | —           |

## Source

[`/src/signalwire/signalwire/agent_server.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/agent_server.py)

Line 72.
