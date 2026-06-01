---
slug: "/reference/typescript/relay/call/call/refer"
title: "refer"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.refer"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `refer`

Transfer a SIP call via REFER.

## Signature

```typescript
refer(
  device: Record<string, unknown>,
  options: { ...1 fields } = {}
): Promise<Record<string, unknown>>
```

## Parameters

| Name                | Type                      | Required | Default | Description                                   |
| ------------------- | ------------------------- | -------- | ------- | --------------------------------------------- |
| `device`            | `Record<string, unknown>` | yes      | —       | Platform-shaped SIP target device descriptor. |
| `options`           | `{ statusUrl?: string }`  | yes      | `{}`    | Optional REFER behaviour.                     |
| `options.statusUrl` | `string`                  | no       | —       | Webhook URL for REFER status events.          |

## Returns

`Promise<Record<string, unknown>>` — The platform's refer response.

## Throws

- When the refer command is rejected.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 592.
