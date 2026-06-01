---
slug: "/reference/typescript/swml-builder/swml-builder/say"
title: "say"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.say"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlBuilder.ts"
---
# `say`

Add a 'play' verb with say: prefix for text-to-speech.
Convenience wrapper matching Python SDK's `say()` method.

## Signature

```typescript
say(text: string, opts?: { ...4 fields }): this
```

## Parameters

| Name            | Type                                                                      | Required | Default | Description                                                |
| --------------- | ------------------------------------------------------------------------- | -------- | ------- | ---------------------------------------------------------- |
| `text`          | `string`                                                                  | yes      | —       | Text to speak.                                             |
| `opts`          | `{ gender?: string; language?: string; voice?: string; volume?: number }` | no       | —       | Optional TTS parameters (voice, language, gender, volume). |
| `opts.gender`   | `string`                                                                  | no       | —       | —                                                          |
| `opts.language` | `string`                                                                  | no       | —       | —                                                          |
| `opts.voice`    | `string`                                                                  | no       | —       | —                                                          |
| `opts.volume`   | `number`                                                                  | no       | —       | —                                                          |

## Returns

`this` — this for fluent chaining.

## Source

[`src/SwmlBuilder.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlBuilder.ts)

Line 220.
