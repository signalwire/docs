---
slug: "/reference/python/signalwire/livewire/agent-session"
title: "AgentSession"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.livewire.AgentSession"
  parent: "signalwire.livewire"
  module: "signalwire.livewire"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/livewire/__init__.py"
---
# `AgentSession`

Mirrors a livekit AgentSession -- orchestrator that binds an Agent
to the SignalWire platform.

## Signature

```python
class AgentSession
```

## Properties

| Name       | Type                   | Required | Default | Description |
| ---------- | ---------------------- | -------- | ------- | ----------- |
| `history`  | `List[Dict[str, str]]` | yes      | —       | —           |
| `userdata` | `userdata`             | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/livewire/agent-session/init)
- [`generate_reply`](/reference/python/signalwire/livewire/agent-session/generate-reply) — Trigger the agent to generate a reply. On SignalWire the prompt handles this; if _instructions_ is provided they are noted.
- [`interrupt`](/reference/python/signalwire/livewire/agent-session/interrupt) — Noop -- SignalWire handles barge-in automatically.
- [`say`](/reference/python/signalwire/livewire/agent-session/say) — Queue text to be spoken by the agent.
- [`start`](/reference/python/signalwire/livewire/agent-session/start) — Bind to an Agent and prepare the underlying SignalWire AgentBase.
- [`update_agent`](/reference/python/signalwire/livewire/agent-session/update-agent) — Swap in a new Agent.

## Source

[`/src/signalwire/signalwire/livewire/__init__.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/livewire/__init__.py)

Line 403.
