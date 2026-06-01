---
slug: "/reference/typescript/livewire/agent/tts-node"
title: "ttsNode"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "livewire.Agent.ttsNode"
  parent: "livewire.Agent"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `ttsNode`

LiveKit-compatible TTS node. **No-op** on SignalWire — the control plane
handles text-to-speech server-side.

## Signature

```typescript
ttsNode(_text?: unknown, _modelSettings?: unknown): Promise<void>
```

## Parameters

| Name             | Type      | Required | Default | Description                   |
| ---------------- | --------- | -------- | ------- | ----------------------------- |
| `_text`          | `unknown` | no       | —       | Text to synthesise (ignored). |
| `_modelSettings` | `unknown` | no       | —       | Model settings (ignored).     |

## Returns

`Promise<void>`

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 329.
