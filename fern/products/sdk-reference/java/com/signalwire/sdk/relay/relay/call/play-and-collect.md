---
slug: "/reference/java/com/signalwire/sdk/relay/relay/call/play-and-collect"
title: "playAndCollect"
sdk_label: "Java SDK"
icon: "java"
lustri:
  auto_generated: true
  kind: "method"
  language: "java"
  qualified_name: "com.signalwire.sdk.relay.Call.playAndCollect"
  parent: "com.signalwire.sdk.relay.Call"
  module: "com.signalwire.sdk.relay.Call"
  source_url: "https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java"
  visibility: "public"
---
# `playAndCollect`

Play media and collect input.

## Signature

**Overload 1**

```java
public com.signalwire.sdk.relay.Action.PlayAndCollectAction playAndCollect(
    java.util.List<java.util.Map<java.lang.String,java.lang.Object>> media,
    java.util.Map<java.lang.String,java.lang.Object> collectConfig,
    java.util.Map<java.lang.String,java.lang.Object> options
)
```

**Overload 2**

```java
public com.signalwire.sdk.relay.Action.PlayAndCollectAction playAndCollect(
    java.util.List<java.util.Map<java.lang.String,java.lang.Object>> media,
    java.util.Map<java.lang.String,java.lang.Object> collectConfig,
    java.lang.String controlId
)
```

## Parameters (Overload 1)

| Name            | Type                                                               | Required | Default | Description           |
| --------------- | ------------------------------------------------------------------ | -------- | ------- | --------------------- |
| `media`         | `java.util.List<java.util.Map<java.lang.String,java.lang.Object>>` | yes      | —       | list of media objects |
| `collectConfig` | `java.util.Map<java.lang.String,java.lang.Object>`                 | yes      | —       | collect configuration |
| `options`       | `java.util.Map<java.lang.String,java.lang.Object>`                 | yes      | —       | optional parameters   |

## Parameters (Overload 2)

| Name            | Type                                                               | Required | Default | Description |
| --------------- | ------------------------------------------------------------------ | -------- | ------- | ----------- |
| `media`         | `java.util.List<java.util.Map<java.lang.String,java.lang.Object>>` | yes      | —       | —           |
| `collectConfig` | `java.util.Map<java.lang.String,java.lang.Object>`                 | yes      | —       | —           |
| `controlId`     | `java.lang.String`                                                 | yes      | —       | —           |

## Returns (Overload 1)

`com.signalwire.sdk.relay.Action.PlayAndCollectAction` — a PlayAndCollectAction

## Returns (Overload 2)

`com.signalwire.sdk.relay.Action.PlayAndCollectAction`

## Source

[`src/main/java/com/signalwire/sdk/relay/Call.java`](https://github.com/signalwire/signalwire-java/blob/main/src/main/java/com/signalwire/sdk/relay/Call.java)

Line 622.
