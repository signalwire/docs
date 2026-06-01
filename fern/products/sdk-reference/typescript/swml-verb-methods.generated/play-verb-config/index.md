---
slug: "/reference/typescript/swml-verb-methods.generated/play-verb-config"
title: "PlayVerbConfig"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "SwmlVerbMethods.generated.PlayVerbConfig"
  parent: "SwmlVerbMethods.generated"
  module: "SwmlVerbMethods.generated"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `PlayVerbConfig`

## Signature

```typescript
interface PlayVerbConfig
```

## Properties

| Name           | Type       | Required | Default | Description                                                        |
| -------------- | ---------- | -------- | ------- | ------------------------------------------------------------------ |
| `auto_answer`  | `boolean`  | no       | —       | If true, auto-answer the call before playing audio. Default true.  |
| `say_gender`   | `string`   | no       | —       | Gender for text-to-speech ("male" or "female").                    |
| `say_language` | `string`   | no       | —       | Language code for text-to-speech (e.g. "en-US").                   |
| `say_voice`    | `string`   | no       | —       | Voice name to use for text-to-speech (e.g. "Polly.Joanna").        |
| `url`          | `string`   | no       | —       | Single URL to play (mutually exclusive with urls).                 |
| `urls`         | `string[]` | no       | —       | Array of URLs to play (mutually exclusive with url).               |
| `volume`       | `number`   | no       | —       | Volume level for audio playback. Valid range -40 to 40. Default 0. |

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 24.
