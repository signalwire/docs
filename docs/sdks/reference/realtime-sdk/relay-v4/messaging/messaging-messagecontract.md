---
slug: /sdks/reference/realtime-sdk/relay-v4/messaging/messaging-messagecontract
---

# MessageContract

An object representing an SMS or MMS message.

## **Properties**

### body

• **body**: `string`

Body of the message.

---

### context

• **context**: `string`

The topic the message-object is associated with. Topic was previously called `context`.

---

### direction

• **direction**: `string`

The direction of the message: `inbound` or `outbound`.

---

### from

• **from**: `string`

The phone number the message comes from.

---

### id

• **id**: `string`

The unique identifier of the message.

---

### media

• **media**: `string[]`

Array of media URLs.

---

### reason

• `Optional` **reason**: `string`

Reason why the message was not sent. This is present only in case of failure.

---

### segments

• **segments**: `number`

Number of segments of the message.

---

### state

• **state**: [`MessagingMessageState`](#messagingmessagestate)

The current state of the message.

---

### tags

• **tags**: `string[]`

Array of strings with message tags.

---

### to

• **to**: `string`

The destination number of the message.

## **Type Aliases**

### MessagingMessageState

Ƭ **MessagingMessageState**: `"queued"` \| `"initiated"` \| `"sent"` \| `"delivered"` \| `"undelivered"` \| `"failed"`

The state a message can be in.

- `queued`: The message has been queued in Relay.
- `initiated`: Relay has initiated the process of sending the message.
- `sent`: Relay has sent the message.
- `delivered`: The message has been successfully delivered. Due to the nature of SMS and MMS, receiving a `delivered` event is not guaranteed, even if the message is delivered successfully.
- `undelivered`: The message has not been delivered. Due to the nature of SMS and MMS, receiving a `undelivered` event is not guaranteed, even if the message fails to be delivered.
- `failed`: The request has failed.
