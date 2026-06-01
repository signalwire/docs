---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/collect-digits"
title: "collectDigits"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.collectDigits"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `collectDigits`

Collect digits with an explicit control\_id (test helper).

## Signature

**Overload 1**

```java
public com.signalwire.sdk.relay.Action.CollectAction collectDigits(
    java.util.Map<java.lang.String,java.lang.Object> digitsConfig,
    java.lang.String controlId
)
```

**Overload 2**

```java
public com.signalwire.sdk.relay.Action.CollectAction collectDigits(
    java.util.Map<java.lang.String,java.lang.Object> digitsConfig,
    boolean startInputTimers,
    java.lang.String controlId
)
```

## Parameters (Overload 1)

| Name           | Type                                               | Required | Default | Description |
| -------------- | -------------------------------------------------- | -------- | ------- | ----------- |
| `digitsConfig` | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |
| `controlId`    | `java.lang.String`                                 | yes      | —       | —           |

## Parameters (Overload 2)

| Name               | Type                                               | Required | Default | Description |
| ------------------ | -------------------------------------------------- | -------- | ------- | ----------- |
| `digitsConfig`     | `java.util.Map<java.lang.String,java.lang.Object>` | yes      | —       | —           |
| `startInputTimers` | `boolean`                                          | yes      | —       | —           |
| `controlId`        | `java.lang.String`                                 | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.relay.Action.CollectAction`

## Returns (Overload 2)

`com.signalwire.sdk.relay.Action.CollectAction`

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 598.
