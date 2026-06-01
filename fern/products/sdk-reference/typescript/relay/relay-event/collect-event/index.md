---
slug: "/reference/typescript/relay/relay-event/collect-event"
title: "CollectEvent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "relay.RelayEvent.CollectEvent"
  parent: "relay.RelayEvent"
  module: "relay.RelayEvent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts"
---
# `CollectEvent`

`calling.call.collect` — caller input (DTMF or speech) collected by a collect action.

## Signature

```typescript
class CollectEvent extends RelayEvent
```

## Inheritance

**Extends:** [RelayEvent](/reference/typescript/relay/relay-event/relay-event)

## Properties

| Name        | Type                   | Required | Default | Description                                                      |
| ----------- | ---------------------- | -------- | ------- | ---------------------------------------------------------------- |
| `callId`    | `string`               | yes      | —       | Call ID associated with the event, or `""` for non-call events.  |
| `controlId` | `string`               | yes      | —       | —                                                                |
| `eventType` | `string`               | yes      | —       | Fully-qualified event type (e.g. `"calling.call.state"`).        |
| `final`     | `boolean \| undefined` | yes      | —       | —                                                                |
| `params`    | `Record<string, any>`  | yes      | —       | Raw params dict from the RELAY notification.                     |
| `result`    | `Record<string, any>`  | yes      | —       | —                                                                |
| `state`     | `string`               | yes      | —       | —                                                                |
| `timestamp` | `number`               | yes      | —       | Server timestamp (epoch seconds) at which the event was emitted. |

## Methods

- [`constructor`](/reference/typescript/relay/relay-event/collect-event/constructor)
- [`fromPayload`](/reference/typescript/relay/relay-event/collect-event/from-payload) — Factory that builds a typed event from a raw `signalwire.event` payload. Subclasses override this to populate their specialised fields; the base implementation returns a minimal `RelayEvent` used as the fallback for unrecognised event types.

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 243.
