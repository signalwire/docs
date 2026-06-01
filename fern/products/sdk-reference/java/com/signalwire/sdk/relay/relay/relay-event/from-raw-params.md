---
slug: "/reference/java/com/signalwire/sdk/relay/relay/relay-event/from-raw-params"
title: "fromRawParams"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.RelayEvent.fromRawParams"
  parent: "com.signalwire.sdk.relay.RelayEvent"
  module: "com.signalwire.sdk.relay.RelayEvent"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayEvent.java"
  visibility: "public"
---
# `fromRawParams`

Create the appropriate event subclass from raw JSON-RPC event params.

**Modifiers:** `static`

## Signature

```java
public static com.signalwire.sdk.relay.RelayEvent fromRawParams(
    java.util.Map<java.lang.String,java.lang.Object> outerParams
)
```

## Parameters

| Name          | Type                                               | Required | Default | Description |
| ------------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `outerParams` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |

## Returns

`com.signalwire.sdk.relay.RelayEvent`

## Source

[`src/main/java/com/signalwire/sdk/relay/RelayEvent.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/RelayEvent.java)

Line 65.
