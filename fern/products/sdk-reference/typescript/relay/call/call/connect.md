---
slug: "/reference/typescript/relay/call/call/connect"
title: "connect"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.connect"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `connect`

Bridge the call to one or more destinations.

## Signature

```typescript
connect(
  devices: Record<string, unknown>[][],
  options: { ...5 fields } = {}
): Promise<Record<string, unknown>>
```

## Parameters

| Name                        | Type                                                                                                                           | Required | Default | Description                                                                                 |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- | ------------------------------------------------------------------------------------------- |
| `devices`                   | `Record<string, unknown>[][]`                                                                                                  | yes      | —       | Serial/parallel dial plan — outer array of serial groups, inner arrays dialled in parallel. |
| `options`                   | `{ maxDuration?: number; maxPricePerMinute?: number; ringback?: Record<string, unknown>[]; statusUrl?: string; tag?: string }` | yes      | `{}`    | Connect behaviour.                                                                          |
| `options.maxDuration`       | `number`                                                                                                                       | no       | —       | Maximum connect duration in seconds.                                                        |
| `options.maxPricePerMinute` | `number`                                                                                                                       | no       | —       | Price cap per minute.                                                                       |
| `options.ringback`          | `Record<string, unknown>[]`                                                                                                    | no       | —       | Ringback media played to the originating party.                                             |
| `options.statusUrl`         | `string`                                                                                                                       | no       | —       | Webhook URL for status events.                                                              |
| `options.tag`               | `string`                                                                                                                       | no       | —       | Tag for event correlation.                                                                  |

## Returns

`Promise<Record<string, unknown>>` — The platform's connect response.

## Throws

- When the connect command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 509.
