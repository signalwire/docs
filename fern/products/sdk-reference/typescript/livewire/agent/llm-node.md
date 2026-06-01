---
slug: "/reference/typescript/livewire/agent/llm-node"
title: "llmNode"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "livewire.Agent.llmNode"
  parent: "livewire.Agent"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `llmNode`

LiveKit-compatible LLM node. **No-op** on SignalWire — the control plane
handles LLM inference server-side.

## Signature

```typescript
llmNode(
  _chatCtx?: unknown,
  _tools?: unknown,
  _modelSettings?: unknown
): Promise<void>
```

## Parameters

| Name             | Type      | Required | Default | Description               |
| ---------------- | --------- | -------- | ------- | ------------------------- |
| `_chatCtx`       | `unknown` | no       | —       | Chat context (ignored).   |
| `_tools`         | `unknown` | no       | —       | Tool list (ignored).      |
| `_modelSettings` | `unknown` | no       | —       | Model settings (ignored). |

## Returns

`Promise<void>`

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 315.
