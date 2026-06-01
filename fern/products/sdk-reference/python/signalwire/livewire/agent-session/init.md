---
slug: "/reference/python/signalwire/livewire/agent-session/init"
title: "__init__"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "method"
  language: "python"
  qualified_name: "signalwire.livewire.AgentSession.__init__"
  parent: "signalwire.livewire.AgentSession"
  module: "signalwire.livewire"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/livewire/__init__.py"
---
# `__init__`

## Signature

```python
__init__(
    *,
    stt: Any = None,
    tts: Any = None,
    llm: Any = None,
    vad: Any = None,
    turn_detection: Any = None,
    tools: Optional[List[Any]] = None,
    mcp_servers: Any = None,
    userdata: Any = None,
    allow_interruptions: bool = True,
    min_interruption_duration: float = 0.5,
    min_endpointing_delay: float = 0.5,
    max_endpointing_delay: float = 3.0,
    max_tool_steps: int = 3,
    preemptive_generation: bool = False
)
```

## Parameters

| Name                        | Type                  | Required | Default | Description |
| --------------------------- | --------------------- | -------- | ------- | ----------- |
| `stt`                       | `Any`                 | no       | `None`  | —           |
| `tts`                       | `Any`                 | no       | `None`  | —           |
| `llm`                       | `Any`                 | no       | `None`  | —           |
| `vad`                       | `Any`                 | no       | `None`  | —           |
| `turn_detection`            | `Any`                 | no       | `None`  | —           |
| `tools`                     | `Optional[List[Any]]` | no       | `None`  | —           |
| `mcp_servers`               | `Any`                 | no       | `None`  | —           |
| `userdata`                  | `Any`                 | no       | `None`  | —           |
| `allow_interruptions`       | `bool`                | no       | `True`  | —           |
| `min_interruption_duration` | `float`               | no       | `0.5`   | —           |
| `min_endpointing_delay`     | `float`               | no       | `0.5`   | —           |
| `max_endpointing_delay`     | `float`               | no       | `3.0`   | —           |
| `max_tool_steps`            | `int`                 | no       | `3`     | —           |
| `preemptive_generation`     | `bool`                | no       | `False` | —           |

## Source

[`/src/signalwire/signalwire/livewire/__init__.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/livewire/__init__.py)

Line 407.
