---
slug: "/reference/typescript/function-result/function-result/set-end-of-speech-timeout"
title: "setEndOfSpeechTimeout"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.setEndOfSpeechTimeout"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `setEndOfSpeechTimeout`

Set the silence duration that marks the end of a user's speech.

## Signature

```typescript
setEndOfSpeechTimeout(milliseconds: number): this
```

## Parameters

| Name           | Type     | Required | Default | Description              |
| -------------- | -------- | -------- | ------- | ------------------------ |
| `milliseconds` | `number` | yes      | —       | Timeout in milliseconds. |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 283.
