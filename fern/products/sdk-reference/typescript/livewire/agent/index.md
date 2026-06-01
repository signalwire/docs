---
slug: "/reference/typescript/livewire/agent"
title: "Agent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "livewire.Agent"
  parent: "livewire"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `Agent`

Mirrors a LiveKit `voice.Agent` — holds instructions and tool definitions.

Pipeline options (`stt`, `tts`, `vad`, `llm`, `turnDetection`) are accepted
for API parity but are **no-ops** — SignalWire's control plane handles the
entire AI pipeline server-side. Set instructions and tools; everything else
just logs once and continues.

## Signature

```typescript
class Agent<UserData = any>
```

## Type Parameters

| Name       | Type | Required | Default | Description |
| ---------- | ---- | -------- | ------- | ----------- |
| `UserData` | —    | yes      | `any`   | —           |

## Examples

```typescript
import { livewire } from '@signalwire/sdk';

const timeTool = livewire.tool({
  description: 'Return the current time.',
  execute: () => new Date().toISOString(),
});

const agent = new livewire.Agent({
  instructions: 'You are a friendly helper.',
  tools: [{ ...timeTool, name: 'time' }],
});

const session = new livewire.AgentSession();
await session.start({ agent });
```

## Properties

| Name           | Type                                                   | Required | Default | Description                                                                                                                                                                                |
| -------------- | ------------------------------------------------------ | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `instructions` | `string`                                               | yes      | —       | System instructions passed through to the SignalWire AI prompt.                                                                                                                            |
| `session`      | `get/set session: AgentSession<UserData> \| undefined` | yes      | —       | The currently-bound [AgentSession](/reference/typescript/livewire/agent-session), or `undefined` until [AgentSession.start](/reference/typescript/livewire/agent-session/start) is called. |
| `tools`        | `Record<string, FunctionTool>`                         | yes      | —       | Registered tools keyed by name. Mutated by [updateTools](/reference/typescript/livewire/agent/update-tools).                                                                               |
| `userData`     | `UserData`                                             | no       | —       | Arbitrary per-session user data passed to tool handlers via [RunContext.userData](/reference/typescript/livewire/run-context#user-data).                                                   |

## Methods

- [`constructor`](/reference/typescript/livewire/agent/constructor)
- [`llmNode`](/reference/typescript/livewire/agent/llm-node) — LiveKit-compatible LLM node. **No-op** on SignalWire — the control plane handles LLM inference server-side.
- [`onEnter`](/reference/typescript/livewire/agent/on-enter) — Lifecycle hook called when the agent enters an active call. Override in a subclass to run setup logic — the default is a no-op.
- [`onExit`](/reference/typescript/livewire/agent/on-exit) — Lifecycle hook called when the agent exits (call ended or handoff). Override in a subclass to run teardown logic — the default is a no-op.
- [`onUserTurnCompleted`](/reference/typescript/livewire/agent/on-user-turn-completed) — Lifecycle hook called when the user finishes speaking. Override in a subclass to inspect / mutate the turn context before the LLM responds — the default is a no-op.
- [`sttNode`](/reference/typescript/livewire/agent/stt-node) — LiveKit-compatible STT node. **No-op** on SignalWire — the control plane handles speech recognition server-side.
- [`ttsNode`](/reference/typescript/livewire/agent/tts-node) — LiveKit-compatible TTS node. **No-op** on SignalWire — the control plane handles text-to-speech server-side.
- [`updateInstructions`](/reference/typescript/livewire/agent/update-instructions) — Update the agent's instructions mid-session.
- [`updateTools`](/reference/typescript/livewire/agent/update-tools) — Update the agent's tool list mid-session.

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 163.
