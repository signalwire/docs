---
slug: "/reference/typescript/livewire/agent-session"
title: "AgentSession"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "livewire.AgentSession"
  parent: "livewire"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `AgentSession`

Mirrors a LiveKit `AgentSession` — binds an [Agent](/reference/typescript/livewire/agent) to SignalWire.

Call [AgentSession.start](/reference/typescript/livewire/agent-session/start) with an `Agent` to construct an internal
[AgentBase](/reference/typescript/agent-base) and begin serving SWML. Pipeline-related options are
accepted for API parity but are no-ops server-side.

## Signature

```typescript
class AgentSession<UserData = any>
```

## Type Parameters

| Name       | Type | Required | Default | Description |
| ---------- | ---- | -------- | ------- | ----------- |
| `UserData` | —    | yes      | `any`   | —           |

## Properties

| Name       | Type                                      | Required | Default | Description                                                              |
| ---------- | ----------------------------------------- | -------- | ------- | ------------------------------------------------------------------------ |
| `history`  | `get history(): Record<string, string>[]` | yes      | —       | Conversation history entries captured over the session's lifetime.       |
| `userData` | `get/set userData: UserData`              | yes      | —       | Current per-session user data. Set by the constructor or via the setter. |

## Methods

- [`constructor`](/reference/typescript/livewire/agent-session/constructor)
- [`generateReply`](/reference/typescript/livewire/agent-session/generate-reply) — Trigger the agent to generate a reply, optionally with extra instructions.
- [`getSwAgent`](/reference/typescript/livewire/agent-session/get-sw-agent) — Return the underlying SignalWire [AgentBase](/reference/typescript/agent-base). Useful for tests and advanced use cases that need to reach past the LiveKit facade.
- [`interrupt`](/reference/typescript/livewire/agent-session/interrupt) — Interrupt current speech. **No-op** on SignalWire — barge-in is handled automatically by the control plane.
- [`say`](/reference/typescript/livewire/agent-session/say) — Queue text to be spoken by the agent.
- [`start`](/reference/typescript/livewire/agent-session/start) — Start the session by binding the agent to a freshly-constructed [AgentBase](/reference/typescript/agent-base), mapping LiveKit-style options onto SignalWire AI params.
- [`updateAgent`](/reference/typescript/livewire/agent-session/update-agent) — Swap the [Agent](/reference/typescript/livewire/agent) bound to this session.

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 420.
