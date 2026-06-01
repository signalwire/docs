---
slug: "/reference/typescript/function-result/function-result/connect"
title: "connect"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.connect"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `connect`

Connect the call to another destination via SWML transfer.

## Signature

```typescript
connect(destination: string, final: boolean = true, fromAddr?: string): this
```

## Parameters

| Name          | Type      | Required | Default | Description                                                |
| ------------- | --------- | -------- | ------- | ---------------------------------------------------------- |
| `destination` | `string`  | yes      | —       | The destination address (phone number or SIP URI).         |
| `final`       | `boolean` | yes      | `true`  | Whether this is a final transfer that ends the AI session. |
| `fromAddr`    | `string`  | no       | —       | Optional caller ID to use for the outbound leg.            |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 146.
