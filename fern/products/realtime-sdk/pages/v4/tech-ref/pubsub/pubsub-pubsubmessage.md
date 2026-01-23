---
title: "PubSubMessage"

---

Represents a message in a PubSub context.


## **Properties**

<ParamField name="id" type="string" required>
  The id of this message.
</ParamField>

<ParamField name="channel" type="string" required>
  The channel in which this message was sent.
</ParamField>

<ParamField name="content" type="any" required>
  The content of this message.
</ParamField>

<ParamField name="publishedAt" type="Date" required>
  The date and time at which this message was published.
</ParamField>

<ParamField name="meta" type="any">
  Any metadata associated to this message.
</ParamField>

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
