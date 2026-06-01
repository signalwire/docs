---
slug: "/reference/typescript/relay/relay-event/message-receive-event"
title: "MessageReceiveEvent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "relay.RelayEvent.MessageReceiveEvent"
  parent: "relay.RelayEvent"
  module: "relay.RelayEvent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts"
---
# `MessageReceiveEvent`

`messaging.receive` — inbound SMS/MMS received on a subscribed context.

## Signature

```typescript
class MessageReceiveEvent extends RelayEvent
```

## Inheritance

**Extends:** [RelayEvent](/reference/typescript/relay/relay-event/relay-event)

## Properties

| Name           | Type                  | Required | Default | Description                                                      |
| -------------- | --------------------- | -------- | ------- | ---------------------------------------------------------------- |
| `body`         | `string`              | yes      | —       | —                                                                |
| `callId`       | `string`              | yes      | —       | Call ID associated with the event, or `""` for non-call events.  |
| `context`      | `string`              | yes      | —       | —                                                                |
| `direction`    | `string`              | yes      | —       | —                                                                |
| `eventType`    | `string`              | yes      | —       | Fully-qualified event type (e.g. `"calling.call.state"`).        |
| `fromNumber`   | `string`              | yes      | —       | —                                                                |
| `media`        | `string[]`            | yes      | —       | —                                                                |
| `messageId`    | `string`              | yes      | —       | —                                                                |
| `messageState` | `string`              | yes      | —       | —                                                                |
| `params`       | `Record<string, any>` | yes      | —       | Raw params dict from the RELAY notification.                     |
| `segments`     | `number`              | yes      | —       | —                                                                |
| `tags`         | `string[]`            | yes      | —       | —                                                                |
| `timestamp`    | `number`              | yes      | —       | Server timestamp (epoch seconds) at which the event was emitted. |
| `toNumber`     | `string`              | yes      | —       | —                                                                |

## Methods

- [`constructor`](/reference/typescript/relay/relay-event/message-receive-event/constructor)
- [`fromPayload`](/reference/typescript/relay/relay-event/message-receive-event/from-payload) — Factory that builds a typed event from a raw `signalwire.event` payload. Subclasses override this to populate their specialised fields; the base implementation returns a minimal `RelayEvent` used as the fallback for unrecognised event types.

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 781.
