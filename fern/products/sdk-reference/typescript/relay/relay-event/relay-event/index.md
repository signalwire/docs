---
slug: "/reference/typescript/relay/relay-event/relay-event"
title: "RelayEvent"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "relay.RelayEvent.RelayEvent"
  parent: "relay.RelayEvent"
  module: "relay.RelayEvent"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts"
---
# `RelayEvent`

Base class for all typed RELAY events.

Raw events arrive as `signalwire.event` JSON-RPC notifications; the client
looks up the correct subclass in [EVENT\_CLASS\_MAP](/reference/typescript/relay/relay-event#event-class-map) and invokes
[RelayEvent.fromPayload](/reference/typescript/relay/relay-event/relay-event/from-payload) to build a typed wrapper. Handlers receive
this wrapper; they can always read the original dict from `params`.

## Signature

```typescript
class RelayEvent
```

## Properties

| Name        | Type                  | Required | Default | Description                                                      |
| ----------- | --------------------- | -------- | ------- | ---------------------------------------------------------------- |
| `callId`    | `string`              | yes      | —       | Call ID associated with the event, or `""` for non-call events.  |
| `eventType` | `string`              | yes      | —       | Fully-qualified event type (e.g. `"calling.call.state"`).        |
| `params`    | `Record<string, any>` | yes      | —       | Raw params dict from the RELAY notification.                     |
| `timestamp` | `number`              | yes      | —       | Server timestamp (epoch seconds) at which the event was emitted. |

## Methods

- [`constructor`](/reference/typescript/relay/relay-event/relay-event/constructor)
- [`fromPayload`](/reference/typescript/relay/relay-event/relay-event/from-payload) — Factory that builds a typed event from a raw `signalwire.event` payload. Subclasses override this to populate their specialised fields; the base implementation returns a minimal `RelayEvent` used as the fallback for unrecognised event types.

## Source

[`src/relay/RelayEvent.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/RelayEvent.ts)

Line 20.
