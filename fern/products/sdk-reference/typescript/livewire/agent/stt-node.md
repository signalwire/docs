---
slug: "/reference/typescript/livewire/agent/stt-node"
title: "sttNode"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "livewire.Agent.sttNode"
  parent: "livewire.Agent"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `sttNode`

LiveKit-compatible STT node. **No-op** on SignalWire — the control plane
handles speech recognition server-side.

## Signature

```typescript
sttNode(_audio?: unknown, _modelSettings?: unknown): Promise<void>
```

## Parameters

| Name             | Type      | Required | Default | Description               |
| ---------------- | --------- | -------- | ------- | ------------------------- |
| `_audio`         | `unknown` | no       | —       | Audio input (ignored).    |
| `_modelSettings` | `unknown` | no       | —       | Model settings (ignored). |

## Returns

`Promise<void>`

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 300.
