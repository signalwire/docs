---
slug: "/reference/typescript/swml-builder/swml-builder/prompt"
title: "prompt"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.prompt"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `prompt`

Play a prompt and wait for input. The input can be received either as digits from the keypad, or from speech, or both depending on what parameters are set. By default, only digit input is enabled. To enable speech input, set at least one speech parameter. To enable both digit and speech input, set at least one parameter for each.

## Signature

```typescript
prompt(config: { ...15 fields }): this
```

## Parameters

| Name                        | Type                                                                                                                                                                                                                                                                                                                                                                   | Required | Default | Description |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `config`                    | `{ digit_timeout?: number; initial_timeout?: number; max_digits?: number; play: unknown[]; say_gender?: string; say_language?: string; say_voice?: string; speech_end_timeout?: number; speech_engine?: string; speech_hints?: string[] \| unknown[]; speech_language?: string; speech_timeout?: number; status_url?: string; terminators?: string; volume?: number }` | yes      | —       | —           |
| `config.digit_timeout`      | `number`                                                                                                                                                                                                                                                                                                                                                               | no       | —       | —           |
| `config.initial_timeout`    | `number`                                                                                                                                                                                                                                                                                                                                                               | no       | —       | —           |
| `config.max_digits`         | `number`                                                                                                                                                                                                                                                                                                                                                               | no       | —       | —           |
| `config.play`               | `unknown[]`                                                                                                                                                                                                                                                                                                                                                            | yes      | —       | —           |
| `config.say_gender`         | `string`                                                                                                                                                                                                                                                                                                                                                               | no       | —       | —           |
| `config.say_language`       | `string`                                                                                                                                                                                                                                                                                                                                                               | no       | —       | —           |
| `config.say_voice`          | `string`                                                                                                                                                                                                                                                                                                                                                               | no       | —       | —           |
| `config.speech_end_timeout` | `number`                                                                                                                                                                                                                                                                                                                                                               | no       | —       | —           |
| `config.speech_engine`      | `string`                                                                                                                                                                                                                                                                                                                                                               | no       | —       | —           |
| `config.speech_hints`       | `string[] \| unknown[]`                                                                                                                                                                                                                                                                                                                                                | no       | —       | —           |
| `config.speech_language`    | `string`                                                                                                                                                                                                                                                                                                                                                               | no       | —       | —           |
| `config.speech_timeout`     | `number`                                                                                                                                                                                                                                                                                                                                                               | no       | —       | —           |
| `config.status_url`         | `string`                                                                                                                                                                                                                                                                                                                                                               | no       | —       | —           |
| `config.terminators`        | `string`                                                                                                                                                                                                                                                                                                                                                               | no       | —       | —           |
| `config.volume`             | `number`                                                                                                                                                                                                                                                                                                                                                               | no       | —       | —           |

## Returns

`this`

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 92.
