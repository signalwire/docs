---
slug: "/reference/typescript/livewire/job-process"
title: "JobProcess"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "livewire.JobProcess"
  parent: "livewire"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `JobProcess`

Mirrors a LiveKit `JobProcess` — placeholder for prewarm / setup hooks.

On SignalWire the control plane pre-warms infrastructure at scale, so this
class carries no real state beyond the LiveKit-compatible `userData` bag.

## Signature

```typescript
class JobProcess
```

## Properties

| Name       | Type                  | Required | Default | Description                                                  |
| ---------- | --------------------- | -------- | ------- | ------------------------------------------------------------ |
| `userData` | `Record<string, any>` | yes      | —       | Mutable bag shared across prewarm and entry-point callbacks. |

## Methods

- [`constructor`](/reference/typescript/livewire/job-process/constructor)

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 780.
