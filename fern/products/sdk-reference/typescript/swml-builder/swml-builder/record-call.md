---
slug: "/reference/typescript/swml-builder/swml-builder/record-call"
title: "record_call"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.record_call"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `record_call`

Record call in the background. Unlike the record method, the record\_call method will start the recording and continue executing the SWML script while allowing the recording to happen in the background. To stop call recordings started with record\_call, use the stop\_record\_call method.

## Signature

```typescript
record_call(config?: { ...11 fields }): this
```

## Parameters

| Name                         | Type                                                                                                                                                                                                                                                                                         | Required | Default | Description |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `config`                     | `{ beep?: boolean; control_id?: string; direction?: "speak" \| "listen" \| "both"; end_silence_timeout?: number; format?: "wav" \| "mp3" \| "mp4"; initial_timeout?: number; input_sensitivity?: number; max_length?: number; status_url?: string; stereo?: boolean; terminators?: string }` | no       | —       | —           |
| `config.beep`                | `boolean`                                                                                                                                                                                                                                                                                    | no       | —       | —           |
| `config.control_id`          | `string`                                                                                                                                                                                                                                                                                     | no       | —       | —           |
| `config.direction`           | `"speak" \| "listen" \| "both"`                                                                                                                                                                                                                                                              | no       | —       | —           |
| `config.end_silence_timeout` | `number`                                                                                                                                                                                                                                                                                     | no       | —       | —           |
| `config.format`              | `"wav" \| "mp3" \| "mp4"`                                                                                                                                                                                                                                                                    | no       | —       | —           |
| `config.initial_timeout`     | `number`                                                                                                                                                                                                                                                                                     | no       | —       | —           |
| `config.input_sensitivity`   | `number`                                                                                                                                                                                                                                                                                     | no       | —       | —           |
| `config.max_length`          | `number`                                                                                                                                                                                                                                                                                     | no       | —       | —           |
| `config.status_url`          | `string`                                                                                                                                                                                                                                                                                     | no       | —       | —           |
| `config.stereo`              | `boolean`                                                                                                                                                                                                                                                                                    | no       | —       | —           |
| `config.terminators`         | `string`                                                                                                                                                                                                                                                                                     | no       | —       | —           |

## Returns

`this`

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 124.
