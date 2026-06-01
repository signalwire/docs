---
slug: "/reference/typescript/livewire/agent-session/constructor"
title: "constructor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "livewire.AgentSession.constructor"
  parent: "livewire.AgentSession"
  module: "livewire"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts"
---
# `constructor`

## Signature

```typescript
constructor<UserData>(options?: { ...14 fields }): AgentSession<UserData>
```

## Type Parameters

| Name       | Type | Required | Default | Description |
| ---------- | ---- | -------- | ------- | ----------- |
| `UserData` | —    | yes      | `any`   | —           |

## Parameters

| Name                              | Type                                                                                                                                                                                                                                                                                                                        | Required | Default | Description |
| --------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `options`                         | `{ allowInterruptions?: boolean; llm?: any; maxEndpointingDelay?: number; maxToolSteps?: number; mcpServers?: unknown; minEndpointingDelay?: number; minInterruptionDuration?: number; preemptiveGeneration?: boolean; stt?: any; tools?: FunctionTool[]; tts?: any; turnDetection?: any; userData?: UserData; vad?: any }` | no       | —       | —           |
| `options.allowInterruptions`      | `boolean`                                                                                                                                                                                                                                                                                                                   | no       | —       | —           |
| `options.llm`                     | `any`                                                                                                                                                                                                                                                                                                                       | no       | —       | —           |
| `options.maxEndpointingDelay`     | `number`                                                                                                                                                                                                                                                                                                                    | no       | —       | —           |
| `options.maxToolSteps`            | `number`                                                                                                                                                                                                                                                                                                                    | no       | —       | —           |
| `options.mcpServers`              | `unknown`                                                                                                                                                                                                                                                                                                                   | no       | —       | —           |
| `options.minEndpointingDelay`     | `number`                                                                                                                                                                                                                                                                                                                    | no       | —       | —           |
| `options.minInterruptionDuration` | `number`                                                                                                                                                                                                                                                                                                                    | no       | —       | —           |
| `options.preemptiveGeneration`    | `boolean`                                                                                                                                                                                                                                                                                                                   | no       | —       | —           |
| `options.stt`                     | `any`                                                                                                                                                                                                                                                                                                                       | no       | —       | —           |
| `options.tools`                   | `FunctionTool[]`                                                                                                                                                                                                                                                                                                            | no       | —       | —           |
| `options.tts`                     | `any`                                                                                                                                                                                                                                                                                                                       | no       | —       | —           |
| `options.turnDetection`           | `any`                                                                                                                                                                                                                                                                                                                       | no       | —       | —           |
| `options.userData`                | `UserData`                                                                                                                                                                                                                                                                                                                  | no       | —       | —           |
| `options.vad`                     | `any`                                                                                                                                                                                                                                                                                                                       | no       | —       | —           |

## Returns

`AgentSession<UserData>`

## Source

[`src/livewire/index.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/livewire/index.ts)

Line 436.
