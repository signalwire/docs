---
slug: "/reference/java/com/signalwire/sdk/relay/relay/message/from-receive-event"
title: "fromReceiveEvent"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Message.fromReceiveEvent"
  parent: "com.signalwire.sdk.relay.Message"
  module: "com.signalwire.sdk.relay.Message"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Message.java"
  visibility: "public"
---
# `fromReceiveEvent`

Create a Message from an inbound receive event.

**Modifiers:** `static`

## Signature

```java
public static com.signalwire.sdk.relay.Message fromReceiveEvent(
    com.signalwire.sdk.relay.RelayEvent.MessagingReceiveEvent event
)
```

## Parameters

| Name    | Type                                                        | Required | Default | Description |
| ------- | ----------------------------------------------------------- | -------- | ------- | ----------- |
| `event` | `com.signalwire.sdk.relay.RelayEvent.MessagingReceiveEvent` | yes      | —       | —           |

## Returns

`com.signalwire.sdk.relay.Message`

## Source

[`src/main/java/com/signalwire/sdk/relay/Message.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Message.java)

Line 172.
