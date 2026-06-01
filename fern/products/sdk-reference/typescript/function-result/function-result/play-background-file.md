---
slug: "/reference/typescript/function-result/function-result/play-background-file"
title: "playBackgroundFile"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.playBackgroundFile"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `playBackgroundFile`

Play an audio file in the background during the call.

## Signature

```typescript
playBackgroundFile(filename: string, wait: boolean = false): this
```

## Parameters

| Name       | Type      | Required | Default | Description                                                 |
| ---------- | --------- | -------- | ------- | ----------------------------------------------------------- |
| `filename` | `string`  | yes      | —       | URL or path of the audio file.                              |
| `wait`     | `boolean` | yes      | `false` | Whether to wait for playback to complete before continuing. |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 243.
