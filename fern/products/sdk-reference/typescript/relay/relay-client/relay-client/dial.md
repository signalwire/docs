---
slug: "/reference/typescript/relay/relay-client/relay-client/dial"
title: "dial"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayClient.RelayClient.dial"
  parent: "relay.RelayClient.RelayClient"
  module: "relay.RelayClient"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts"
---
# `dial`

Initiate an outbound call.

Accepts a "dial plan" — an outer array of serial groups, each containing
an inner array of devices dialled in parallel. Resolves when any device
answers; rejects if no device answers within `dialTimeout`.

## Signature

```typescript
dial(
  devices: Record<string, unknown>[][],
  options: { ...3 fields } = {}
): Promise<Call>
```

## Parameters

| Name                  | Type                                                           | Required | Default | Description                                                                         |
| --------------------- | -------------------------------------------------------------- | -------- | ------- | ----------------------------------------------------------------------------------- |
| `devices`             | `Record<string, unknown>[][]`                                  | yes      | —       | Serial/parallel dial plan. `[[A], [B, C]]` dials A first, then B and C in parallel. |
| `options`             | `{ dialTimeout?: number; maxDuration?: number; tag?: string }` | yes      | `{}`    | Optional dial behaviour overrides.                                                  |
| `options.dialTimeout` | `number`                                                       | no       | —       | Dial timeout in seconds (default 120).                                              |
| `options.maxDuration` | `number`                                                       | no       | —       | Maximum call duration in minutes.                                                   |
| `options.tag`         | `string`                                                       | no       | —       | Client-provided tag for event correlation. Auto-generated (UUID) when omitted.      |

## Returns

`Promise<Call>` — A [Call](/reference/typescript/relay/call) representing the answered leg.

## Throws

- When the dial times out.
- When the server rejects the dial request.

## Source

[`src/relay/RelayClient.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayClient.ts)

Line 586.
