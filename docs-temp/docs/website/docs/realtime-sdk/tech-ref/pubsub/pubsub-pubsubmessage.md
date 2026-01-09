---
title: "PubSubMessage"
slug: /pubsub/pubsubmessage

---

Represents a message in a PubSub context.


## **Properties**

<APIField name="id" type="string" required={true}>
  The id of this message.
</APIField>

<APIField name="channel" type="string" required={true}>
  The channel in which this message was sent.
</APIField>

<APIField name="content" type="any" required={true}>
  The content of this message.
</APIField>

<APIField name="publishedAt" type="Date" required={true}>
  The date and time at which this message was published.
</APIField>

<APIField name="meta" type="any">
  Any metadata associated to this message.
</APIField>

## **Example**

Listening for PubSub messages and accessing `PubSubMessage` properties:

```js
import { SignalWire } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

await client.pubSub.listen({
  channels: ["my-channel"],
  onMessageReceived: (message) => {
    console.log("Message ID:", message.id);
    console.log("Channel:", message.channel);
    console.log("Content:", message.content);
    console.log("Published at:", message.publishedAt);
    console.log("Metadata:", message.meta);
  }
});
```
