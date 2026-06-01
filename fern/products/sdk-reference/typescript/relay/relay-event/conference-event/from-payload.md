---
slug: "/reference/typescript/relay/relay-event/conference-event/from-payload"
title: "fromPayload"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "method"
  language: "typescript"
  qualified_name: "relay.RelayEvent.ConferenceEvent.fromPayload"
  parent: "relay.RelayEvent.ConferenceEvent"
  module: "relay.RelayEvent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts"
---
# `fromPayload`

Factory that builds a typed event from a raw `signalwire.event` payload.
Subclasses override this to populate their specialised fields; the base
implementation returns a minimal `RelayEvent` used as the fallback for
unrecognised event types.

**Modifiers:** `static`

## Signature

```typescript
fromPayload(payload: Record<string, any>): ConferenceEvent
```

## Parameters

| Name      | Type                  | Required | Default | Description |
| --------- | --------------------- | -------- | ------- | ----------- |
| `payload` | `Record<string, any>` | yes      | —       | —           |

## Returns

`ConferenceEvent`

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 739.
