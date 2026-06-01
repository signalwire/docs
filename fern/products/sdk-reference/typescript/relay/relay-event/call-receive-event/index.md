---
slug: "/reference/typescript/relay/relay-event/call-receive-event"
title: "CallReceiveEvent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "relay.RelayEvent.CallReceiveEvent"
  parent: "relay.RelayEvent"
  module: "relay.RelayEvent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts"
---
# `CallReceiveEvent`

`calling.call.receive` — fires when an inbound call arrives on a subscribed context.

## Signature

```typescript
class CallReceiveEvent extends RelayEvent
```

## Inheritance

**Extends:** [RelayEvent](/reference/typescript/relay/relay-event/relay-event)

## Properties

| Name        | Type                  | Required | Default | Description                                                      |
| ----------- | --------------------- | -------- | ------- | ---------------------------------------------------------------- |
| `callId`    | `string`              | yes      | —       | Call ID associated with the event, or `""` for non-call events.  |
| `callState` | `string`              | yes      | —       | —                                                                |
| `context`   | `string`              | yes      | —       | —                                                                |
| `device`    | `Record<string, any>` | yes      | —       | —                                                                |
| `direction` | `string`              | yes      | —       | —                                                                |
| `eventType` | `string`              | yes      | —       | Fully-qualified event type (e.g. `"calling.call.state"`).        |
| `nodeId`    | `string`              | yes      | —       | —                                                                |
| `params`    | `Record<string, any>` | yes      | —       | Raw params dict from the RELAY notification.                     |
| `projectId` | `string`              | yes      | —       | —                                                                |
| `segmentId` | `string`              | yes      | —       | —                                                                |
| `tag`       | `string`              | yes      | —       | —                                                                |
| `timestamp` | `number`              | yes      | —       | Server timestamp (epoch seconds) at which the event was emitted. |

## Methods

- [`constructor`](/reference/typescript/relay/relay-event/call-receive-event/constructor)
- [`fromPayload`](/reference/typescript/relay/relay-event/call-receive-event/from-payload) — Factory that builds a typed event from a raw `signalwire.event` payload. Subclasses override this to populate their specialised fields; the base implementation returns a minimal `RelayEvent` used as the fallback for unrecognised event types.

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 118.
