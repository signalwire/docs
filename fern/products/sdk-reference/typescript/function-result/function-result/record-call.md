---
slug: "/reference/typescript/function-result/function-result/record-call"
title: "recordCall"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.recordCall"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `recordCall`

Start recording the call.

## Signature

```typescript
recordCall(opts?: { ...11 fields }): this
```

## Parameters

| Name                     | Type                                                                                                                                                                                                                                                                         | Required | Default | Description                                                  |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ------------------------------------------------------------ |
| `opts`                   | `{ beep?: boolean; controlId?: string; direction?: "speak" \| "listen" \| "both"; endSilenceTimeout?: number; format?: "wav" \| "mp3"; initialTimeout?: number; inputSensitivity?: number; maxLength?: number; statusUrl?: string; stereo?: boolean; terminators?: string }` | no       | —       | Recording options including format, direction, and timeouts. |
| `opts.beep`              | `boolean`                                                                                                                                                                                                                                                                    | no       | —       | —                                                            |
| `opts.controlId`         | `string`                                                                                                                                                                                                                                                                     | no       | —       | —                                                            |
| `opts.direction`         | `"speak" \| "listen" \| "both"`                                                                                                                                                                                                                                              | no       | —       | —                                                            |
| `opts.endSilenceTimeout` | `number`                                                                                                                                                                                                                                                                     | no       | —       | —                                                            |
| `opts.format`            | `"wav" \| "mp3"`                                                                                                                                                                                                                                                             | no       | —       | —                                                            |
| `opts.initialTimeout`    | `number`                                                                                                                                                                                                                                                                     | no       | —       | —                                                            |
| `opts.inputSensitivity`  | `number`                                                                                                                                                                                                                                                                     | no       | —       | —                                                            |
| `opts.maxLength`         | `number`                                                                                                                                                                                                                                                                     | no       | —       | —                                                            |
| `opts.statusUrl`         | `string`                                                                                                                                                                                                                                                                     | no       | —       | —                                                            |
| `opts.stereo`            | `boolean`                                                                                                                                                                                                                                                                    | no       | —       | —                                                            |
| `opts.terminators`       | `string`                                                                                                                                                                                                                                                                     | no       | —       | —                                                            |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 517.
