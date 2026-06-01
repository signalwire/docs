---
slug: "/reference/typescript/function-result/function-result/wait-for-user"
title: "waitForUser"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.waitForUser"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `waitForUser`

Wait for user input before continuing.

## Signature

```typescript
waitForUser(opts?: { ...3 fields }): this
```

## Parameters

| Name               | Type                                                             | Required | Default | Description                                                                       |
| ------------------ | ---------------------------------------------------------------- | -------- | ------- | --------------------------------------------------------------------------------- |
| `opts`             | `{ answerFirst?: boolean; enabled?: boolean; timeout?: number }` | no       | —       | Options controlling wait behavior: enable/disable, timeout, or answer-first mode. |
| `opts.answerFirst` | `boolean`                                                        | no       | —       | —                                                                                 |
| `opts.enabled`     | `boolean`                                                        | no       | —       | —                                                                                 |
| `opts.timeout`     | `number`                                                         | no       | —       | —                                                                                 |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 206.
