---
slug: "/reference/typescript/livewire/run-context"
title: "RunContext"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "livewire.RunContext"
  parent: "livewire"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `RunContext`

Mirrors a LiveKit `RunContext` — passed to tool handlers so they can
read the current session, call handle, and user data.

## Signature

```typescript
class RunContext<UserData = any>
```

## Type Parameters

| Name       | Type | Required | Default | Description |
| ---------- | ---- | -------- | ------- | ----------- |
| `UserData` | —    | yes      | `any`   | —           |

## Properties

| Name           | Type                       | Required | Default | Description                                                                                 |
| -------------- | -------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------- |
| `functionCall` | `unknown`                  | no       | —       | Opaque function-call descriptor (LiveKit shape; passed through untouched).                  |
| `session`      | `AgentSession<UserData>`   | no       | —       | The owning [AgentSession](/reference/typescript/livewire/agent-session), when one is bound. |
| `speechHandle` | `unknown`                  | no       | —       | Opaque speech-turn handle (LiveKit shape; passed through untouched).                        |
| `userData`     | `get userData(): UserData` | yes      | —       | Per-session user data, or an empty object when no session is bound.                         |

## Methods

- [`constructor`](/reference/typescript/livewire/run-context/constructor)

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 376.
