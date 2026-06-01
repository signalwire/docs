---
slug: "/reference/typescript/swml-builder/swml-builder/detect-machine"
title: "detect_machine"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.detect_machine"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `detect_machine`

A detection method that combines AMD (Answering Machine Detection) and fax detection. Detect whether the user on the other end of the call is a machine (fax, voicemail, etc.) or a human. The detection result(s) will be sent to the specified status\_url as a POST request and will also be saved in the detect\_result variable.

## Signature

```typescript
detect_machine(config?: { ...11 fields }): this
```

## Parameters

| Name                             | Type                                                                                                                                                                                                                                                                                             | Required | Default | Description |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- | ----------- |
| `config`                         | `{ detect_message_end?: boolean; detectors?: string; end_silence_timeout?: number; initial_timeout?: number; machine_ready_timeout?: number; machine_voice_threshold?: number; machine_words_threshold?: number; status_url?: string; timeout?: number; tone?: "CED" \| "CNG"; wait?: boolean }` | no       | —       | —           |
| `config.detect_message_end`      | `boolean`                                                                                                                                                                                                                                                                                        | no       | —       | —           |
| `config.detectors`               | `string`                                                                                                                                                                                                                                                                                         | no       | —       | —           |
| `config.end_silence_timeout`     | `number`                                                                                                                                                                                                                                                                                         | no       | —       | —           |
| `config.initial_timeout`         | `number`                                                                                                                                                                                                                                                                                         | no       | —       | —           |
| `config.machine_ready_timeout`   | `number`                                                                                                                                                                                                                                                                                         | no       | —       | —           |
| `config.machine_voice_threshold` | `number`                                                                                                                                                                                                                                                                                         | no       | —       | —           |
| `config.machine_words_threshold` | `number`                                                                                                                                                                                                                                                                                         | no       | —       | —           |
| `config.status_url`              | `string`                                                                                                                                                                                                                                                                                         | no       | —       | —           |
| `config.timeout`                 | `number`                                                                                                                                                                                                                                                                                         | no       | —       | —           |
| `config.tone`                    | `"CED" \| "CNG"`                                                                                                                                                                                                                                                                                 | no       | —       | —           |
| `config.wait`                    | `boolean`                                                                                                                                                                                                                                                                                        | no       | —       | —           |

## Returns

`this`

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 217.
