---
slug: "/reference/java/com/signalwire/sdk/relay/relay/message/wait-for-completion"
title: "waitForCompletion"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Message.waitForCompletion"
  parent: "com.signalwire.sdk.relay.Message"
  module: "com.signalwire.sdk.relay.Message"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Message.java"
  visibility: "public"
---
# `waitForCompletion`

Block until the message reaches a terminal state.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.relay.RelayEvent waitForCompletion()
```

**Overload 2**

```java
public com.signalwire.sdk.relay.RelayEvent waitForCompletion(long timeoutMs)
```

## Parameters (Overload 2)

| Name        | Type   | Required | Default | Description |
| ----------- | ------ | -------- | ------- | ----------- |
| `timeoutMs` | `long` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.relay.RelayEvent`

## Returns (Overload 2)

`com.signalwire.sdk.relay.RelayEvent`

## Source

[`src/main/java/com/signalwire/sdk/relay/Message.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Message.java)

Line 128.
