---
---

# MessageContract

[link]: #messagingmessagestate

An object representing an SMS or MMS message.

## **Properties**

<ParamField name="body" type="string" required>
  Body of the message.
</ParamField>

<ParamField name="context" type="string" required>
  The topic the message-object is associated with. Topic was previously called `context`.
</ParamField>

<ParamField name="direction" type="string" required>
  The direction of the message: `inbound` or `outbound`.
</ParamField>

<ParamField name="from" type="string" required>
  The phone number the message comes from.
</ParamField>

<ParamField name="id" type="string" required>
  The unique identifier of the message.
</ParamField>

<ParamField name="media" type="string[]" required>
  Array of media URLs.
</ParamField>

<ParamField name="reason" type="string">
  Reason why the message was not sent. This is present only in case of failure.
</ParamField>

<ParamField name="segments" type="number" required>
  Number of segments of the message.
</ParamField>

<ParamField name="state" type="MessagingMessageState" required>
  The current state of the message. See [`MessagingMessageState`][link].
</ParamField>

<ParamField name="tags" type="string[]" required>
  Array of strings with message tags.
</ParamField>

<ParamField name="to" type="string" required>
  The destination number of the message.
</ParamField>

## **Type Aliases**

### MessagingMessageState

Ƭ **MessagingMessageState**: `"queued"` \| `"initiated"` \| `"sent"` \| `"delivered"` \| `"undelivered"` \| `"failed"`

The state a message can be in.

- `queued`: The message has been queued in RELAY.
- `initiated`: RELAY has initiated the process of sending the message.
- `sent`: RELAY has sent the message.
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
