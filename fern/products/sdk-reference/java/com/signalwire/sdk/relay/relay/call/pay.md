---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/pay"
title: "pay"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.pay"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `pay`

Process payment via DTMF.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.relay.Action.PayAction pay(
    java.lang.String paymentConnectorUrl,
    java.util.Map<java.lang.String,java.lang.Object> options
)
```

**Overload 2**

```java
public com.signalwire.sdk.relay.Action.PayAction pay(
    java.lang.String paymentConnectorUrl,
    java.lang.String controlId
)
```

## Parameters (Overload 1)

| Name                  | Type                                               | Required | Default | Description         |
| --------------------- | -------------------------------------------------- | -------- | ------- | ------------------- |
| `paymentConnectorUrl` | `java.lang.String`                                 | yes      | —       | connector URL       |
| `options`             | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | optional parameters |

## Parameters (Overload 2)

| Name                  | Type               | Required | Default | Description |
| --------------------- | ------------------ | -------- | ------- | ----------- |
| `paymentConnectorUrl` | `java.lang.String` | yes      | —       | —           |
| `controlId`           | `java.lang.String` | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.relay.Action.PayAction` — a PayAction

## Returns (Overload 2)

`com.signalwire.sdk.relay.Action.PayAction`

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 660.
