---
slug: "/reference/python/signalwire/livewire/agent"
title: "Agent"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "class"
  language: "python"
  qualified_name: "signalwire.livewire.Agent"
  parent: "signalwire.livewire"
  module: "signalwire.livewire"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/livewire/__init__.py"
---
# `Agent`

Mirrors a livekit Agent -- holds instructions and tool definitions.

## Signature

```python
class Agent
```

## Properties

| Name           | Type                     | Required | Default | Description |
| -------------- | ------------------------ | -------- | ------- | ----------- |
| `instructions` | `instructions`           | yes      | —       | —           |
| `session`      | `Optional[AgentSession]` | yes      | —       | —           |

## Methods

- [`__init__`](/reference/python/signalwire/livewire/agent/init)
- [`llm_node`](/reference/python/signalwire/livewire/agent/llm-node) — Noop -- SignalWire handles LLM in its control plane.
- [`on_enter`](/reference/python/signalwire/livewire/agent/on-enter) — Called when the agent enters. Override in subclass.
- [`on_exit`](/reference/python/signalwire/livewire/agent/on-exit) — Called when the agent exits. Override in subclass.
- [`on_user_turn_completed`](/reference/python/signalwire/livewire/agent/on-user-turn-completed) — Called when the user finishes speaking. Override in subclass.
- [`stt_node`](/reference/python/signalwire/livewire/agent/stt-node) — Noop -- SignalWire handles STT in its control plane.
- [`tts_node`](/reference/python/signalwire/livewire/agent/tts-node) — Noop -- SignalWire handles TTS in its control plane.
- [`update_instructions`](/reference/python/signalwire/livewire/agent/update-instructions) — Update the agent's instructions mid-session.
- [`update_tools`](/reference/python/signalwire/livewire/agent/update-tools) — Update the agent's tool list mid-session.

## Source

[`/src/signalwire/signalwire/livewire/__init__.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/livewire/__init__.py)

Line 271.
