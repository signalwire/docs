---
slug: "/reference/typescript/function-result/function-result/sip-refer"
title: "sipRefer"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.sipRefer"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `sipRefer`

Send a SIP REFER to transfer the call.

## Signature

```typescript
sipRefer(toUri: string): this
```

## Parameters

| Name    | Type     | Required | Default | Description                       |
| ------- | -------- | -------- | ------- | --------------------------------- |
| `toUri` | `string` | yes      | —       | The SIP URI to refer the call to. |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 624.
