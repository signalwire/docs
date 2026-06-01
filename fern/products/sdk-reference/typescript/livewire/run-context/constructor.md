---
slug: "/reference/typescript/livewire/run-context/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "livewire.RunContext.constructor"
  parent: "livewire.RunContext"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `constructor`

## Signature

```typescript
constructor<UserData>(
  session?: AgentSession<UserData>,
  options?: { ...2 fields }
): RunContext<UserData>
```

## Type Parameters

| Name       | Type | Required | Default | Description |
| ---------- | ---- | -------- | ------- | ----------- |
| `UserData` | —    | yes      | `any`   | —           |

## Parameters

| Name                   | Type                                                 | Required | Default | Description                              |
| ---------------------- | ---------------------------------------------------- | -------- | ------- | ---------------------------------------- |
| `session`              | `AgentSession<UserData>`                             | no       | —       | Owning session, when available.          |
| `options`              | `{ functionCall?: unknown; speechHandle?: unknown }` | no       | —       | Optional pass-through values.            |
| `options.functionCall` | `unknown`                                            | no       | —       | Opaque LiveKit function-call descriptor. |
| `options.speechHandle` | `unknown`                                            | no       | —       | Opaque LiveKit speech handle.            |

## Returns

`RunContext<UserData>`

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 390.
