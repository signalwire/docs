---
slug: "/reference/typescript/function-result/function-result/tap"
title: "tap"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.tap"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `tap`

Start a media tap to stream audio to an external URI.

## Signature

```typescript
tap(opts: { ...6 fields }): this
```

## Parameters

| Name             | Type                                                                                                                                            | Required | Default | Description                                         |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | --------------------------------------------------- |
| `opts`           | `{ codec?: "PCMU" \| "PCMA"; controlId?: string; direction?: "speak" \| "both" \| "hear"; rtpPtime?: number; statusUrl?: string; uri: string }` | yes      | —       | Tap parameters including URI, direction, and codec. |
| `opts.codec`     | `"PCMU" \| "PCMA"`                                                                                                                              | no       | —       | —                                                   |
| `opts.controlId` | `string`                                                                                                                                        | no       | —       | —                                                   |
| `opts.direction` | `"speak" \| "both" \| "hear"`                                                                                                                   | no       | —       | —                                                   |
| `opts.rtpPtime`  | `number`                                                                                                                                        | no       | —       | —                                                   |
| `opts.statusUrl` | `string`                                                                                                                                        | no       | —       | —                                                   |
| `opts.uri`       | `string`                                                                                                                                        | yes      | —       | —                                                   |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 571.
