---
slug: "/reference/typescript/livewire/agent-session/start"
title: "start"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "livewire.AgentSession.start"
  parent: "livewire.AgentSession"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `start`

Start the session by binding the agent to a freshly-constructed
[AgentBase](/reference/typescript/agent-base), mapping LiveKit-style options onto SignalWire AI params.

Must be called before any other method on this session. The underlying
`AgentBase` is not started here — use [runApp](/reference/typescript/livewire/run-app) or an `AgentServer`
to serve it.

## Signature

```typescript
start(params: { ...3 fields }): Promise<void>
```

## Parameters

| Name            | Type                                                       | Required | Default | Description                                                |
| --------------- | ---------------------------------------------------------- | -------- | ------- | ---------------------------------------------------------- |
| `params`        | `{ agent: Agent<UserData>; record?: boolean; room?: any }` | yes      | —       | Start parameters.                                          |
| `params.agent`  | `Agent<UserData>`                                          | yes      | —       | The [Agent](/reference/typescript/livewire/agent) to bind. |
| `params.record` | `boolean`                                                  | no       | —       | Call-recording flag placeholder; ignored on SignalWire.    |
| `params.room`   | `any`                                                      | no       | —       | LiveKit room placeholder; ignored on SignalWire.           |

## Returns

`Promise<void>` — Resolves once the underlying `AgentBase` has been built.

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 514.
