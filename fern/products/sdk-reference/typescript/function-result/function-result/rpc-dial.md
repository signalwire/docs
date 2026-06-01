---
slug: "/reference/typescript/function-result/function-result/rpc-dial"
title: "rpcDial"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.rpcDial"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `rpcDial`

Dial a number via RPC, optionally specifying device type.

## Signature

```typescript
rpcDial(
  toNumber: string,
  fromNumber: string,
  destSwml: string,
  deviceType: string = 'phone'
): this
```

## Parameters

| Name         | Type     | Required | Default   | Description                               |
| ------------ | -------- | -------- | --------- | ----------------------------------------- |
| `toNumber`   | `string` | yes      | —         | The destination phone number.             |
| `fromNumber` | `string` | yes      | —         | The caller ID number.                     |
| `destSwml`   | `string` | yes      | —         | The SWML destination for the dialed call. |
| `deviceType` | `string` | yes      | `'phone'` | The device type (defaults to "phone").    |

## Returns

`this` — This instance for chaining.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 732.
