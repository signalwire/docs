---
slug: "/reference/typescript/relay/types/collect-config"
title: "CollectConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "relay.types.CollectConfig"
  parent: "relay.types"
  module: "relay.types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts"
---
# `CollectConfig`

Collect input configuration.

## Signature

```typescript
interface CollectConfig
```

## Properties

| Name              | Type                                                                                                             | Required | Default | Description                 |
| ----------------- | ---------------------------------------------------------------------------------------------------------------- | -------- | ------- | --------------------------- |
| `continuous`      | `boolean`                                                                                                        | no       | —       | Continuous mode?            |
| `digits`          | `{ digit_timeout?: number; max: number; terminators?: string }`                                                  | no       | —       | Collect digits.             |
| `initial_timeout` | `number`                                                                                                         | no       | —       | Initial timeout in seconds. |
| `partial_results` | `boolean`                                                                                                        | no       | —       | Partial results?            |
| `speech`          | `{ end_silence_timeout?: number; hints?: string[]; language?: string; model?: string; speech_timeout?: number }` | no       | —       | Collect speech.             |

## Source

[`src/relay/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/types.ts)

Line 131.
