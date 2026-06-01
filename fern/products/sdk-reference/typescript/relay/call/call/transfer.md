---
slug: "/reference/typescript/relay/call/call/transfer"
title: "transfer"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.transfer"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `transfer`

Transfer call control to another RELAY app or SWML script.

## Signature

```typescript
transfer(
  dest: string,
  extra?: Record<string, unknown>
): Promise<Record<string, unknown>>
```

## Parameters

| Name    | Type                      | Required | Default | Description                                                  |
| ------- | ------------------------- | -------- | ------- | ------------------------------------------------------------ |
| `dest`  | `string`                  | yes      | —       | Destination identifier (RELAY context, SWML URL, etc.).      |
| `extra` | `Record<string, unknown>` | no       | —       | Optional additional params merged into the transfer request. |

## Returns

`Promise<Record<string, unknown>>` — The platform's transfer response.

## Throws

- When the transfer command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 803.
