---
slug: "/reference/python/signalwire/livewire"
title: "livewire"
sdk_label: "Python SDK"
icon: "python"
lustri:
  auto_generated: true
  kind: "module"
  language: "python"
  qualified_name: "signalwire.livewire"
  parent: "signalwire"
  module: "signalwire"
  source_url: "https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/livewire/__init__.py"
---
# `livewire`

Copyright (c) 2025 SignalWire

This file is part of the SignalWire SDK.

Licensed under the MIT License.
See LICENSE file in the project root for full license information.

## Signature

```python
module livewire
```

## Properties

| Name        | Type        | Required | Default | Description |
| ----------- | ----------- | -------- | ------- | ----------- |
| `__all__`   | `__all__`   | yes      | —       | —           |
| `cli_ns`    | `cli_ns`    | yes      | —       | —           |
| `inference` | `inference` | yes      | —       | —           |
| `llm_ns`    | `llm_ns`    | yes      | —       | —           |
| `voice`     | `voice`     | yes      | —       | —           |

## Constants

| Name        | Type        | Required | Default | Description |
| ----------- | ----------- | -------- | ------- | ----------- |
| `BANNER`    | `BANNER`    | yes      | —       | —           |
| `NOT_GIVEN` | `NOT_GIVEN` | yes      | —       | —           |
| `TIPS`      | `TIPS`      | yes      | —       | —           |

## Functions

- [`function_tool`](/reference/python/signalwire/livewire/function-tool) — Mirrors the livekit `@function_tool` decorator.
- [`run_app`](/reference/python/signalwire/livewire/run-app) — Print banner, print a random tip, run the agent.

## Classes

- [`Agent`](/reference/python/signalwire/livewire/agent) — Mirrors a livekit Agent -- holds instructions and tool definitions.
- [`AgentHandoff`](/reference/python/signalwire/livewire/agent-handoff) — Signals a handoff to another agent in multi-agent scenarios.
- [`AgentServer`](/reference/python/signalwire/livewire/agent-server) — Mirrors a livekit AgentServer -- registers entrypoints and starts.
- [`AgentSession`](/reference/python/signalwire/livewire/agent-session) — Mirrors a livekit AgentSession -- orchestrator that binds an Agent to the SignalWire platform.
- [`ChatContext`](/reference/python/signalwire/livewire/chat-context) — Minimal stub mirroring livekit ChatContext.
- [`InferenceLLM`](/reference/python/signalwire/livewire/inference-llm) — Stub for livekit inference.LLM.
- [`InferenceSTT`](/reference/python/signalwire/livewire/inference-stt) — Stub for livekit inference.STT.
- [`InferenceTTS`](/reference/python/signalwire/livewire/inference-tts) — Stub for livekit inference.TTS.
- [`JobContext`](/reference/python/signalwire/livewire/job-context) — Mirrors a livekit JobContext -- provides room and connection info.
- [`JobProcess`](/reference/python/signalwire/livewire/job-process) — Mirrors a livekit JobProcess -- used for prewarm/setup.
- [`Room`](/reference/python/signalwire/livewire/room) — Stub -- SignalWire doesn't use the LiveKit room abstraction.
- [`RunContext`](/reference/python/signalwire/livewire/run-context) — Mirrors livekit RunContext -- available inside tool handlers.
- [`StopResponse`](/reference/python/signalwire/livewire/stop-response) — Signals that a tool should not trigger another LLM reply.
- [`ToolError`](/reference/python/signalwire/livewire/tool-error) — Signals a tool execution error.

## Modules

- [`plugins`](/reference/python/signalwire/livewire/plugins) — Copyright (c) 2025 SignalWire

## Source

[`/src/signalwire/signalwire/livewire/__init__.py`](https://github.com/signalwire/signalwire-python/blob/main//src/signalwire/signalwire/livewire/__init__.py)
