---
slug: /messaging/messaging-sendresult
sidebar_label: MessagingSendResult
---

# MessagingSendResult

## **Properties**

<APIField name="code" type="string" required={true}>
  Numeric error or success code.
</APIField>

<APIField name="message" type="string" required={true}>
  Error or success message.
</APIField>

<APIField name="messageId" type="string" required={true}>
  The unique identifier of the message.
</APIField>

## **Example**

Sending an SMS and handling the result:

```js
import { SignalWire } from "@signalwire/realtime-api";

const client = await SignalWire({ project: "your-project-id", token: "your-api-token" });

const result = await client.messaging.send({
  from: "+1xxxxxxxxxx",
  to: "+1yyyyyyyyyy",
  body: "Hello from SignalWire!"
});

console.log("Message ID:", result.messageId);
console.log("Code:", result.code);
console.log("Message:", result.message);
```

Sending an MMS with media:

```js
const result = await client.messaging.send({
  from: "+1xxxxxxxxxx",
  to: "+1yyyyyyyyyy",
  body: "Check out this image!",
  media: ["https://example.com/image.jpg"]
});

console.log("MMS sent with ID:", result.messageId);
```
