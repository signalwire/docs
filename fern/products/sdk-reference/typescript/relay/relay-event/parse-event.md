---
slug: "/reference/typescript/relay/relay-event/parse-event"
title: "parseEvent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "function"
  language: "typescript"
  qualified_name: "relay.RelayEvent.parseEvent"
  parent: "relay.RelayEvent"
  module: "relay.RelayEvent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts"
---
# `parseEvent`

Parse a raw signalwire.event params dict into a typed event object.

## Signature

```typescript
parseEvent(payload: Record<string, any>): RelayEvent
```

## Parameters

| Name      | Type                  | Required | Default | Description |
| --------- | --------------------- | -------- | ------- | ----------- |
| `payload` | `Record<string, any>` | yes      | —       | —           |

## Returns

`RelayEvent`

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 940.
