---
slug: "/reference/python/signalwire/livewire/agent-server/rtc-session"
title: "rtc_session"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.livewire.AgentServer.rtc_session"
  parent: "signalwire.livewire.AgentServer"
  module: "signalwire.livewire"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/livewire/__init__.py"
---
# `rtc_session`

Decorator that registers the session entrypoint.

## Signature

```python
rtc_session(
    func = None,
    *,
    agent_name: str = '',
    type: str = 'room',
    on_request = None,
    on_session_end = None
)
```

## Parameters

| Name             | Type  | Required | Default  | Description |
| ---------------- | ----- | -------- | -------- | ----------- |
| `func`           | —     | no       | `None`   | —           |
| `agent_name`     | `str` | no       | `''`     | —           |
| `type`           | `str` | no       | `'room'` | —           |
| `on_request`     | —     | no       | `None`   | —           |
| `on_session_end` | —     | no       | `None`   | —           |

## Source

[`/src/signalwire/signalwire/livewire/__init__.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/livewire/__init__.py)

Line 691.
