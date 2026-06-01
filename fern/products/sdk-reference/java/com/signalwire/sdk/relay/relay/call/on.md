---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/on"
title: "on"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.on"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `on`

Register an event listener on this call.

## Signature

```java
public void on(
    java.util.function.Consumer<com.signalwire.sdk.relay.RelayEvent> listener
)
```

## Parameters

| Name       | Type                                                               | Required | Default | Description |
| ---------- | ------------------------------------------------------------------ | -------- | ------- | ----------- |
| `listener` | `java.util.function.Consumer<com.signalwire.sdk.relay.RelayEvent>` | yes      | —       | —           |

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 85.
