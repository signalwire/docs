---
slug: "/reference/typescript/livewire/job-context"
title: "JobContext"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "livewire.JobContext"
  parent: "livewire"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `JobContext`

Mirrors a LiveKit `JobContext` — provides room and connection info to the
entry-point callback registered via [defineAgent](/reference/typescript/livewire/define-agent).

## Signature

```typescript
class JobContext
```

## Properties

| Name   | Type         | Required | Default | Description                                                                                                 |
| ------ | ------------ | -------- | ------- | ----------------------------------------------------------------------------------------------------------- |
| `proc` | `JobProcess` | yes      | —       | Shared [JobProcess](/reference/typescript/livewire/job-process) instance for prewarm-to-entry data passing. |
| `room` | `Room`       | yes      | —       | Placeholder [Room](/reference/typescript/livewire/room) (see class docs).                                   |

## Methods

- [`connect`](/reference/typescript/livewire/job-context/connect) — Connect to the platform. **No-op** on SignalWire — the control plane manages connection lifecycle automatically.
- [`constructor`](/reference/typescript/livewire/job-context/constructor)
- [`waitForParticipant`](/reference/typescript/livewire/job-context/wait-for-participant) — Wait for a participant to join. **No-op** on SignalWire — returns an immediate stub participant.

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 808.
