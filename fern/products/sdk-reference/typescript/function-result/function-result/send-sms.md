---
slug: "/reference/typescript/function-result/function-result/send-sms"
title: "sendSms"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "FunctionResult.FunctionResult.sendSms"
  parent: "FunctionResult.FunctionResult"
  module: "FunctionResult"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts"
---
# `sendSms`

Send an SMS or MMS message from within the call flow.

## Signature

```typescript
sendSms(opts: { ...6 fields }): this
```

## Parameters

| Name              | Type                                                                                                          | Required | Default | Description                                                                                        |
| ----------------- | ------------------------------------------------------------------------------------------------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------- |
| `opts`            | `{ body?: string; fromNumber: string; media?: string[]; region?: string; tags?: string[]; toNumber: string }` | yes      | —       | SMS parameters. Must include either `body` (text SMS) or `media` (MMS) — supplying neither throws. |
| `opts.body`       | `string`                                                                                                      | no       | —       | —                                                                                                  |
| `opts.fromNumber` | `string`                                                                                                      | yes      | —       | —                                                                                                  |
| `opts.media`      | `string[]`                                                                                                    | no       | —       | —                                                                                                  |
| `opts.region`     | `string`                                                                                                      | no       | —       | —                                                                                                  |
| `opts.tags`       | `string[]`                                                                                                    | no       | —       | —                                                                                                  |
| `opts.toNumber`   | `string`                                                                                                      | yes      | —       | —                                                                                                  |

## Returns

`this` — This instance for chaining.

## Throws

- When neither `body` nor `media` is provided.

## Source

[`src/FunctionResult.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/FunctionResult.ts)

Line 486.
