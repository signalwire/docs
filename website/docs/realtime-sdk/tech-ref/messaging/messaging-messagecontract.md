---
slug: /messaging/message-contract
sidebar_label: MessageContract
---

# MessageContract

[link]: #messagingmessagestate

An object representing an SMS or MMS message.

## **Properties**

<APIField name="body" type="string" required={true}>
  Body of the message.
</APIField>

<APIField name="context" type="string" required={true}>
  The topic the message-object is associated with. Topic was previously called `context`.
</APIField>

<APIField name="direction" type="string" required={true}>
  The direction of the message: `inbound` or `outbound`.
</APIField>

<APIField name="from" type="string" required={true}>
  The phone number the message comes from.
</APIField>

<APIField name="id" type="string" required={true}>
  The unique identifier of the message.
</APIField>

<APIField name="media" type="string[]" required={true}>
  Array of media URLs.
</APIField>

<APIField name="reason" type="string">
  Reason why the message was not sent. This is present only in case of failure.
</APIField>

<APIField name="segments" type="number" required={true}>
  Number of segments of the message.
</APIField>

<APIField name="state" type="MessagingMessageState" required={true}>
  The current state of the message. See [`MessagingMessageState`][link].
</APIField>

<APIField name="tags" type="string[]" required={true}>
  Array of strings with message tags.
</APIField>

<APIField name="to" type="string" required={true}>
  The destination number of the message.
</APIField>

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

## **Example**

Listening for incoming and outgoing messages:

```js
import { SignalWire } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

await client.messaging.listen({
  topics: ["my-topic"],
  onMessageReceived: (message) => {
    console.log("Message ID:", message.id);
    console.log("From:", message.from);
    console.log("To:", message.to);
    console.log("Body:", message.body);
    console.log("Direction:", message.direction);
    console.log("State:", message.state);
    console.log("Segments:", message.segments);

    if (message.media.length > 0) {
      console.log("Media URLs:", message.media);
    }
  },
  onMessageUpdated: (message) => {
    console.log("Message updated:", message.id);
    console.log("New state:", message.state);

    if (message.state === "failed" && message.reason) {
      console.log("Failed reason:", message.reason);
    }
  }
});
```
