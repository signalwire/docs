---
slug: "/reference/typescript/swml-builder/swml-builder/answer"
title: "answer"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "SwmlBuilder.SwmlBuilder.answer"
  parent: "SwmlBuilder.SwmlBuilder"
  module: "SwmlBuilder"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts"
---
# `answer`

Answer incoming call and set an optional maximum duration.

## Signature

```typescript
answer(config?: { ...4 fields }): this
```

## Parameters

| Name                  | Type                                                                               | Required | Default | Description |
| --------------------- | ---------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `config`              | `{ codecs?: string; max_duration?: number; password?: string; username?: string }` | no       | —       | —           |
| `config.codecs`       | `string`                                                                           | no       | —       | —           |
| `config.max_duration` | `number`                                                                           | no       | —       | —           |
| `config.password`     | `string`                                                                           | no       | —       | —           |
| `config.username`     | `string`                                                                           | no       | —       | —           |

## Returns

`this`

## Source

[`src/SwmlVerbMethods.generated.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/SwmlVerbMethods.generated.ts)

Line 44.
