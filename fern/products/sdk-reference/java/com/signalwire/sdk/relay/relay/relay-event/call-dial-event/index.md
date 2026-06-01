---
slug: "/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-dial-event"
title: "CallDialEvent"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "class"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.RelayEvent.CallDialEvent"
  parent: "com.signalwire.sdk.relay.RelayEvent"
  module: "com.signalwire.sdk.relay"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayEvent.java"
  visibility: "public"
---
# `CallDialEvent`

Dial completion event (`calling.call.dial`).

<p>
 Note: No top-level `call_id`. The call info is nested at `params.call`.

**Modifiers:** `static`

## Signature

```java
public static class CallDialEvent extends com.signalwire.sdk.relay.RelayEvent
```

## Inheritance

**Extends:** [com.signalwire.sdk.relay.RelayEvent](/reference/java/com/signalwire/sdk/relay/relay/relay-event)

## Methods

- [`<init>`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-dial-event/init)
- [`getCallId`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-dial-event/get-call-id)
- [`getCallInfo`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-dial-event/get-call-info)
- [`getDialState`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-dial-event/get-dial-state)
- [`getNodeId`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-dial-event/get-node-id)
- [`getTag`](/reference/java/com/signalwire/sdk/relay/relay/relay-event/call-dial-event/get-tag)

## Source

[`src/main/java/com/signalwire/sdk/relay/RelayEvent.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayEvent.java)

Line 205.
