---
slug: "/reference/typescript/relay/message/message"
title: "Message"
sdk_label: "TypeScript SDK"
icon: "typescript"
lustri:
  auto_generated: true
  kind: "class"
  language: "typescript"
  qualified_name: "relay.Message.Message"
  parent: "relay.Message"
  module: "relay.Message"
  source_url: "https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Message.ts"
---
# `Message`

SMS/MMS message in the RELAY messaging namespace.

Outbound messages progress through `queued` → `initiated` → `sent` → `delivered`
(or `undelivered` / `failed`). Inbound messages arrive with state `received`.
Call [Message.wait](/reference/typescript/relay/message/message/wait) to await a terminal state.

## Signature

```typescript
class Message
```

## Examples

```typescript
const msg = await client.sendMessage({
  to: '+15551234567',
  from: '+15557654321',
  body: 'Your code is 4242',
});

const final = await msg.wait(30); // seconds
console.log('Final state:', final.params.message_state);
```

## Properties

| Name         | Type                               | Required | Default | Description                                                            |
| ------------ | ---------------------------------- | -------- | ------- | ---------------------------------------------------------------------- |
| `body`       | `string`                           | yes      | —       | Plain-text message body.                                               |
| `context`    | `string`                           | yes      | —       | RELAY context the message belongs to.                                  |
| `direction`  | `string`                           | yes      | —       | `"inbound"` or `"outbound"`.                                           |
| `fromNumber` | `string`                           | yes      | —       | Sender phone number in E.164 format.                                   |
| `isDone`     | `get isDone(): boolean`            | yes      | —       | True once the message has reached a terminal state.                    |
| `media`      | `string[]`                         | yes      | —       | Media URLs attached to the message (MMS).                              |
| `messageId`  | `string`                           | yes      | —       | Unique message identifier assigned by the platform.                    |
| `reason`     | `string`                           | yes      | —       | Failure / undelivery reason when `state` is non-successful.            |
| `result`     | `get result(): RelayEvent \| null` | yes      | —       | Final event that terminated the message, or `null` if still in-flight. |
| `segments`   | `number`                           | yes      | —       | Number of segments the carrier split the message into.                 |
| `state`      | `string`                           | yes      | —       | Current message state (e.g. `"sent"`, `"delivered"`, `"failed"`).      |
| `tags`       | `string[]`                         | yes      | —       | Opaque tags attached to the message.                                   |
| `toNumber`   | `string`                           | yes      | —       | Destination phone number in E.164 format.                              |

## Methods

- [`constructor`](/reference/typescript/relay/message/message/constructor)
- [`on`](/reference/typescript/relay/message/message/on) — Register an event listener for state changes on this message.
- [`toString`](/reference/typescript/relay/message/message/to-string) — Return a human-readable diagnostic string.
- [`wait`](/reference/typescript/relay/message/message/wait) — Wait for the message to reach a terminal state (`delivered`, `failed`, `undelivered`, etc.).

## Source

[`src/relay/Message.ts`](https://github.com/signalwire/signalwire-typescript/blob/main/src/relay/Message.ts)

Line 36.
