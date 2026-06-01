---
slug: "/reference/java/com/signalwire/sdk/relay/relay/action/is-terminal"
title: "isTerminal"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Action.isTerminal"
  parent: "com.signalwire.sdk.relay.Action"
  module: "com.signalwire.sdk.relay.Action"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Action.java"
  visibility: "protected"
---
# `isTerminal`

Check if a state is terminal for this action type.

Subclasses may override for custom terminal states.

## Signature

```java
protected boolean isTerminal(java.lang.String actionState)
```

## Parameters

| Name          | Type               | Required | Default | Description |
| ------------- | ------------------ | -------- | ------- | ----------- |
| `actionState` | `java.lang.String` | yes      | —       | —           |

## Returns

`boolean`

## Source

[`src/main/java/com/signalwire/sdk/relay/Action.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Action.java)

Line 132.
