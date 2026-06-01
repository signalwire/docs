---
slug: "/reference/typescript/swml-builder/swml-builder/record"
title: "record"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.record"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `record`

Record the call audio in the foreground, pausing further SWML execution until recording ends. Use this, for example, to record voicemails. To record calls in the background in a non-blocking fashion, use the record\_call method.

## Signature

```typescript
record(config?: { ...10 fields }): this
```

## Parameters

| Name                         | Type                                                                                                                                                                                                                                                          | Required | Default | Description |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `config`                     | `{ beep?: boolean; direction?: "speak" \| "listen"; end_silence_timeout?: number; format?: "wav" \| "mp3" \| "mp4"; initial_timeout?: number; input_sensitivity?: number; max_length?: number; status_url?: string; stereo?: boolean; terminators?: string }` | no       | —       | —           |
| `config.beep`                | `boolean`                                                                                                                                                                                                                                                     | no       | —       | —           |
| `config.direction`           | `"speak" \| "listen"`                                                                                                                                                                                                                                         | no       | —       | —           |
| `config.end_silence_timeout` | `number`                                                                                                                                                                                                                                                      | no       | —       | —           |
| `config.format`              | `"wav" \| "mp3" \| "mp4"`                                                                                                                                                                                                                                     | no       | —       | —           |
| `config.initial_timeout`     | `number`                                                                                                                                                                                                                                                      | no       | —       | —           |
| `config.input_sensitivity`   | `number`                                                                                                                                                                                                                                                      | no       | —       | —           |
| `config.max_length`          | `number`                                                                                                                                                                                                                                                      | no       | —       | —           |
| `config.status_url`          | `string`                                                                                                                                                                                                                                                      | no       | —       | —           |
| `config.stereo`              | `boolean`                                                                                                                                                                                                                                                     | no       | —       | —           |
| `config.terminators`         | `string`                                                                                                                                                                                                                                                      | no       | —       | —           |

## Returns

`this`

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 112.
