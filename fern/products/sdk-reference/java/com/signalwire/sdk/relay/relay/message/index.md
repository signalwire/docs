---
slug: "/reference/java/com/signalwire/sdk/relay/relay/message"
title: "Message"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Message"
  parent: "com.signalwire.sdk.relay"
  module: "com.signalwire.sdk.relay"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Message.java"
  visibility: "public"
---
# `Message`

Represents an SMS/MMS message with state tracking.

<p>
 Messages are simpler than calls: they have a `message_id`, progress through
 states (queued, initiated, sent, delivered), and support completion waiting.
 <p>
 State progression:
 <ul>
   <li>Success: queued -> initiated -> sent -> delivered</li>
   <li>Failure: queued -> initiated -> failed/undelivered</li>
 </ul>
 Terminal states: delivered, undelivered, failed

## Signature

```java
public class Message
```

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/relay/relay/message/init)
- [`fromReceiveEvent`](/reference/java/com/signalwire/sdk/relay/relay/message/from-receive-event) — Create a Message from an inbound receive event.
- [`getBody`](/reference/java/com/signalwire/sdk/relay/relay/message/get-body)
- [`getContext`](/reference/java/com/signalwire/sdk/relay/relay/message/get-context)
- [`getDirection`](/reference/java/com/signalwire/sdk/relay/relay/message/get-direction)
- [`getFromNumber`](/reference/java/com/signalwire/sdk/relay/relay/message/get-from-number)
- [`getMedia`](/reference/java/com/signalwire/sdk/relay/relay/message/get-media)
- [`getMessageId`](/reference/java/com/signalwire/sdk/relay/relay/message/get-message-id)
- [`getReason`](/reference/java/com/signalwire/sdk/relay/relay/message/get-reason)
- [`getResult`](/reference/java/com/signalwire/sdk/relay/relay/message/get-result)
- [`getSegments`](/reference/java/com/signalwire/sdk/relay/relay/message/get-segments)
- [`getState`](/reference/java/com/signalwire/sdk/relay/relay/message/get-state)
- [`getTags`](/reference/java/com/signalwire/sdk/relay/relay/message/get-tags)
- [`getToNumber`](/reference/java/com/signalwire/sdk/relay/relay/message/get-to-number)
- [`isDone`](/reference/java/com/signalwire/sdk/relay/relay/message/is-done)
- [`on`](/reference/java/com/signalwire/sdk/relay/relay/message/on) — Register a state change listener.
- [`setBody`](/reference/java/com/signalwire/sdk/relay/relay/message/set-body)
- [`setContext`](/reference/java/com/signalwire/sdk/relay/relay/message/set-context)
- [`setDirection`](/reference/java/com/signalwire/sdk/relay/relay/message/set-direction)
- [`setFromNumber`](/reference/java/com/signalwire/sdk/relay/relay/message/set-from-number)
- [`setMedia`](/reference/java/com/signalwire/sdk/relay/relay/message/set-media)
- [`setOnCompleted`](/reference/java/com/signalwire/sdk/relay/relay/message/set-on-completed)
- [`setSegments`](/reference/java/com/signalwire/sdk/relay/relay/message/set-segments)
- [`setState`](/reference/java/com/signalwire/sdk/relay/relay/message/set-state)
- [`setTags`](/reference/java/com/signalwire/sdk/relay/relay/message/set-tags)
- [`setToNumber`](/reference/java/com/signalwire/sdk/relay/relay/message/set-to-number)
- [`toString`](/reference/java/com/signalwire/sdk/relay/relay/message/to-string)
- [`updateFromEvent`](/reference/java/com/signalwire/sdk/relay/relay/message/update-from-event) — Update state from an incoming event.
- [`waitForCompletion`](/reference/java/com/signalwire/sdk/relay/relay/message/wait-for-completion) — Block until the message reaches a terminal state.

## Source

[`src/main/java/com/signalwire/sdk/relay/Message.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Message.java)

Line 29.
