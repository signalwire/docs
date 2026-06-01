---
slug: "/reference/java/com/signalwire/sdk/relay/relay/action/wait-for-completion"
title: "waitForCompletion"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Action.waitForCompletion"
  parent: "com.signalwire.sdk.relay.Action"
  module: "com.signalwire.sdk.relay.Action"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Action.java"
  visibility: "public"
---
# `waitForCompletion`

Block until the action reaches a terminal state.

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

| Name        | Type   | Required | Default | Description             |
| ----------- | ------ | -------- | ------- | ----------------------- |
| `timeoutMs` | `long` | yes      | —       | timeout in milliseconds |

## Returns (Overload 1)

`com.signalwire.sdk.relay.RelayEvent` — the terminal event

## Returns (Overload 2)

`com.signalwire.sdk.relay.RelayEvent` — the terminal event, or null on timeout

## Source

[`src/main/java/com/signalwire/sdk/relay/Action.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Action.java)

Line 76.
