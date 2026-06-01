---
slug: "/reference/typescript/relay/call/call/wait-for"
title: "waitFor"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.Call.Call.waitFor"
  parent: "relay.Call.Call"
  module: "relay.Call"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts"
---
# `waitFor`

Wait for a specific event, optionally filtered by predicate.

Registers a one-shot listener that is removed after resolving (or after
the timeout elapses). Useful for awaiting a specific state transition.

## Signature

```typescript
waitFor(
  eventType: string,
  predicate?: (event: RelayEvent) => boolean,
  timeout?: number
): Promise<RelayEvent>
```

## Parameters

| Name        | Type                             | Required | Default | Description                                                                   |
| ----------- | -------------------------------- | -------- | ------- | ----------------------------------------------------------------------------- |
| `eventType` | `string`                         | yes      | —       | Event type to wait for.                                                       |
| `predicate` | `(event: RelayEvent) => boolean` | no       | —       | Optional filter — only events for which this returns `true` resolve the wait. |
| `timeout`   | `number`                         | no       | —       | Optional timeout in milliseconds. Omit to wait forever.                       |

## Returns

`Promise<RelayEvent>` — The first matching [RelayEvent](/reference/typescript/relay/relay-event).

## Throws

- When the optional timeout elapses before a match.

## Source

[`src/relay/Call.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Call.ts)

Line 209.
