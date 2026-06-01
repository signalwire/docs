---
slug: "/reference/java/com/signalwire/sdk/relay/relay/action/update-state"
title: "updateState"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Action.updateState"
  parent: "com.signalwire.sdk.relay.Action"
  module: "com.signalwire.sdk.relay.Action"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Action.java"
  visibility: "public"
---
# `updateState`

Update state from an incoming event.

Resolves the completion future
when a terminal state is reached.

## Signature

```java
public void updateState(
    java.lang.String newState,
    com.signalwire.sdk.relay.RelayEvent event
)
```

## Parameters

| Name       | Type                                  | Required | Default | Description |
| ---------- | ------------------------------------- | -------- | ------- | ----------- |
| `newState` | `java.lang.String`                    | yes      | —       | —           |
| `event`    | `com.signalwire.sdk.relay.RelayEvent` | yes      | —       | —           |

## Source

[`src/main/java/com/signalwire/sdk/relay/Action.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Action.java)

Line 109.
