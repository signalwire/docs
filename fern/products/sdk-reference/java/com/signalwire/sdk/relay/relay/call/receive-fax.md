---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/receive-fax"
title: "receiveFax"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.receiveFax"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `receiveFax`

Receive a fax.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.relay.Action.ReceiveFaxAction receiveFax(
    java.util.Map<java.lang.String,java.lang.Object> options
)
```

**Overload 2**

```java
public com.signalwire.sdk.relay.Action.ReceiveFaxAction receiveFax(
    java.lang.String controlId
)
```

## Parameters (Overload 1)

| Name      | Type                                               | Required | Default | Description         |
| --------- | -------------------------------------------------- | -------- | ------- | ------------------- |
| `options` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | optional parameters |

## Parameters (Overload 2)

| Name        | Type               | Required | Default | Description |
| ----------- | ------------------ | -------- | ------- | ----------- |
| `controlId` | `java.lang.String` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.relay.Action.ReceiveFaxAction` — a ReceiveFaxAction

## Returns (Overload 2)

`com.signalwire.sdk.relay.Action.ReceiveFaxAction`

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 724.
