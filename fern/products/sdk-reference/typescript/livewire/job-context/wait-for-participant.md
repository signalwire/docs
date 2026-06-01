---
slug: "/reference/typescript/livewire/job-context/wait-for-participant"
title: "waitForParticipant"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "livewire.JobContext.waitForParticipant"
  parent: "livewire.JobContext"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `waitForParticipant`

Wait for a participant to join. **No-op** on SignalWire — returns an
immediate stub participant.

## Signature

```typescript
waitForParticipant(options?: { ...1 fields }): Promise<any>
```

## Parameters

| Name               | Type                    | Required | Default | Description                                                          |
| ------------------ | ----------------------- | -------- | ------- | -------------------------------------------------------------------- |
| `options`          | `{ identity?: string }` | no       | —       | Participant match options.                                           |
| `options.identity` | `string`                | no       | —       | Requested identity; echoed back in the stub. Defaults to `"caller"`. |

## Returns

`Promise<any>` — A stub participant `{ identity }` record.

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 843.
