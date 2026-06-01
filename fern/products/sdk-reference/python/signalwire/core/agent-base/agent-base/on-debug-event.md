---
slug: "/reference/python/signalwire/core/agent-base/agent-base/on-debug-event"
title: "on_debug_event"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.core.agent_base.AgentBase.on_debug_event"
  parent: "signalwire.core.agent_base.AgentBase"
  module: "signalwire.core.agent_base"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py"
---
# `on_debug_event`

Register a handler for debug webhook events.

Use as a decorator to receive real-time debug events from the AI module
during calls. Requires enable\_debug\_events() to be called first.

> \[!NOTE]
> event\_type (str): The event label (e.g. "barge", "llm\_error", "session\_start")
> data (dict): The full event payload including call\_id, label, and event-specific fields

The handler may be sync or async.

> \[!NOTE]
> @agent.on\_debug\_event
> def handle(event\_type, data):
> if event\_type == "barge":
> print(f"Barge detected: {data.get('barge\_elapsed\_ms')}ms")

## Signature

```python
on_debug_event(handler: Callable) -> Callable
```

## Parameters

| Name      | Type       | Required | Default | Description                                                     |
| --------- | ---------- | -------- | ------- | --------------------------------------------------------------- |
| `handler` | `Callable` | yes      | —       | Callback function with signature (event\_type: str, data: dict) |

## Returns

`Callable` — The handler function (unchanged), for use as a decorator

## Source

[`/src/signalwire/signalwire/core/agent_base.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/core/agent_base.py)

Line 458.
