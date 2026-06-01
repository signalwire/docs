---
slug: "/reference/typescript/livewire/run-app"
title: "runApp"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "livewire.runApp"
  parent: "livewire"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `runApp`

Mirrors `cli.runApp()` from `@livekit/agents-js`.

1. Prints the LiveWire banner
2. Runs the registered prewarm callback (if any) with a fresh [JobProcess](/reference/typescript/livewire/job-process)
3. Creates a fresh [JobContext](/reference/typescript/livewire/job-context)
4. Prints a random tip
5. Invokes the entry function with the context
6. Starts the underlying SignalWire `AgentBase` once the entry function
   binds one (via an `AgentSession.start()` call)

Accepts either an object `{ entry, prewarm? }`, a bare entry function, or
an [AgentServer](/reference/typescript/agent-server) instance.

## Signature

```typescript
runApp(options: any): void
```

## Parameters

| Name      | Type  | Required | Default | Description                                         |
| --------- | ----- | -------- | ------- | --------------------------------------------------- |
| `options` | `any` | yes      | —       | Agent descriptor, entry function, or `AgentServer`. |

## Returns

`void`

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 892.
