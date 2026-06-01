---
slug: "/reference/typescript/livewire/agent/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "livewire.Agent.constructor"
  parent: "livewire.Agent"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `constructor`

## Signature

```typescript
constructor<UserData>(options?: { ...13 fields }): Agent<UserData>
```

## Type Parameters

| Name       | Type | Required | Default | Description |
| ---------- | ---- | -------- | ------- | ----------- |
| `UserData` | —    | yes      | `any`   | —           |

## Parameters

| Name                          | Type                                                                                                                                                                                                                                                                                             | Required | Default | Description |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- | ----------- |
| `options`                     | `{ allowInterruptions?: boolean; chatCtx?: unknown; instructions?: string; llm?: unknown; maxEndpointingDelay?: number; mcpServers?: unknown; minEndpointingDelay?: number; stt?: unknown; tools?: FunctionTool[]; tts?: unknown; turnDetection?: unknown; userData?: UserData; vad?: unknown }` | no       | —       | —           |
| `options.allowInterruptions`  | `boolean`                                                                                                                                                                                                                                                                                        | no       | —       | —           |
| `options.chatCtx`             | `unknown`                                                                                                                                                                                                                                                                                        | no       | —       | —           |
| `options.instructions`        | `string`                                                                                                                                                                                                                                                                                         | no       | —       | —           |
| `options.llm`                 | `unknown`                                                                                                                                                                                                                                                                                        | no       | —       | —           |
| `options.maxEndpointingDelay` | `number`                                                                                                                                                                                                                                                                                         | no       | —       | —           |
| `options.mcpServers`          | `unknown`                                                                                                                                                                                                                                                                                        | no       | —       | —           |
| `options.minEndpointingDelay` | `number`                                                                                                                                                                                                                                                                                         | no       | —       | —           |
| `options.stt`                 | `unknown`                                                                                                                                                                                                                                                                                        | no       | —       | —           |
| `options.tools`               | `FunctionTool[]`                                                                                                                                                                                                                                                                                 | no       | —       | —           |
| `options.tts`                 | `unknown`                                                                                                                                                                                                                                                                                        | no       | —       | —           |
| `options.turnDetection`       | `unknown`                                                                                                                                                                                                                                                                                        | no       | —       | —           |
| `options.userData`            | `UserData`                                                                                                                                                                                                                                                                                       | no       | —       | —           |
| `options.vad`                 | `unknown`                                                                                                                                                                                                                                                                                        | no       | —       | —           |

## Returns

`Agent<UserData>`

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 182.
