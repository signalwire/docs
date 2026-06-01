---
slug: "/reference/typescript/types/pronunciation-rule"
title: "PronunciationRule"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "interface"
  language: "typescript"
  qualified_name: "types.PronunciationRule"
  parent: "types"
  module: "types"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/types.ts"
---
# `PronunciationRule`

Rule for overriding how the TTS engine pronounces a specific word or phrase.

## Signature

```typescript
interface PronunciationRule
```

## Properties

| Name         | Type      | Required | Default | Description                                   |
| ------------ | --------- | -------- | ------- | --------------------------------------------- |
| `ignoreCase` | `boolean` | no       | —       | Whether the match should be case-insensitive. |
| `replace`    | `string`  | yes      | —       | The text pattern to match.                    |
| `with`       | `string`  | yes      | —       | The replacement pronunciation.                |

## Source

[`src/types.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/types.ts)

Line 123.
