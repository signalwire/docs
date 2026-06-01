---
slug: "/reference/typescript/livewire/define-agent"
title: "defineAgent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "livewire.defineAgent"
  parent: "livewire"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `defineAgent`

Mirrors `@livekit/agents.defineAgent()`.

Packages an entry function (plus an optional prewarm hook) for later
execution by [runApp](/reference/typescript/livewire/run-app). Pass-through — no side effects.

## Signature

```typescript
defineAgent(
  agent: { ...2 fields }
): { entry: (ctx: JobContext) => Promise<void>; prewarm?: (proc: JobProcess) => any }
```

## Parameters

| Name            | Type                                                                                 | Required | Default | Description                                                                                                       |
| --------------- | ------------------------------------------------------------------------------------ | -------- | ------- | ----------------------------------------------------------------------------------------------------------------- |
| `agent`         | `{ entry: (ctx: JobContext) => Promise<void>; prewarm?: (proc: JobProcess) => any }` | yes      | —       | Entry and (optional) prewarm functions.                                                                           |
| `agent.entry`   | `(ctx: JobContext) => Promise<void>`                                                 | yes      | —       | Main callback invoked with a [JobContext](/reference/typescript/livewire/job-context) when the agent runs.        |
| `agent.prewarm` | `(proc: JobProcess) => any`                                                          | no       | —       | Optional prewarm callback invoked with a [JobProcess](/reference/typescript/livewire/job-process) before `entry`. |

## Returns

`{ entry: (ctx: JobContext) => Promise<void>; prewarm?: (proc: JobProcess) => any }` — The same record (pass-through), typed consistently.

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 865.
